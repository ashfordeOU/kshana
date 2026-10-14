# SPDX-License-Identifier: AGPL-3.0-only
"""Basilisk 2.9.1 closed-loop MRP feedback with balanced reaction wheels: the oracle for
tests/aocs_basilisk_oracle.rs, with the cases and module set registered in
xval/aocs-basilisk/PREREGISTRATION.md.

Run with the `bsk` 2.9.1 wheel installed (Python 3.12):
    python gen_aocs_basilisk_oracle.py > aocs_basilisk_oracle.txt

Output, per case: a `case` line, `inertia` (9 numbers, hub inertia including the wheels' Js gg^T),
one `wheel` line per wheel (gs_x gs_y gs_z Js u_max Omega0_rad_s), `init` (sigma_BN, omega_BN_B),
then one `row` per 1 s sample:
    t  sigma(3)  omega(3)  Omega(n)  u_cmd(n)  u_applied(n)
u_cmd is rwMotorTorque's output computed from the state at t (before the wheel limit); u_applied
is the motor torque the wheel effector applies over [t, t + dt] (read at the next tick).
"""
import math

import numpy as np
from Basilisk.architecture import messaging
from Basilisk.fswAlgorithms import attTrackingError, inertial3D, mrpFeedback, rwMotorTorque
from Basilisk.simulation import reactionWheelStateEffector, simpleNav, spacecraft
from Basilisk.utilities import SimulationBaseClass, macros, simIncludeRW

DT = 0.1
DURATION = 600.0
SAMPLE = 1.0
K, P = 3.5, 30.0
I_HUB = np.diag([900.0, 800.0, 600.0])
JS = 0.08


def pyramid():
    b = math.radians(54.7356)
    return [[math.sin(b) * math.cos(math.radians(a)), math.sin(b) * math.sin(math.radians(a)), math.cos(b)]
            for a in (45.0, 135.0, 225.0, 315.0)]


CASES = [
    ("A", [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]], 0.2, [100.0, 200.0, 300.0],
     [0.1, 0.2, -0.3], [0.001, -0.01, 0.03]),
    ("B", pyramid(), 0.2, [100.0, -200.0, 300.0, -400.0], [0.1, 0.2, -0.3], [0.001, -0.01, 0.03]),
    ("C", pyramid(), 0.05, [0.0, 0.0, 0.0, 0.0], [0.5, -0.4, 0.3], [0.0, 0.0, 0.0]),
]


def run(name, axes, u_max, omega_rpm, sigma0, omega0):
    sim = SimulationBaseClass.SimBaseClass()
    proc = sim.CreateNewProcess("proc")
    proc.addTask(sim.CreateNewTask("task", macros.sec2nano(DT)))

    gs = [np.array(a) / np.linalg.norm(a) for a in axes]
    inertia = I_HUB.copy()
    for g in gs:
        inertia += JS * np.outer(g, g)

    sc = spacecraft.Spacecraft()
    sc.ModelTag = "sc"
    sc.hub.mHub = 750.0
    sc.hub.r_BcB_B = [[0.0], [0.0], [0.0]]
    sc.hub.IHubPntBc_B = inertia.tolist()
    sc.hub.sigma_BNInit = [[s] for s in sigma0]
    sc.hub.omega_BN_BInit = [[w] for w in omega0]

    factory = simIncludeRW.rwFactory()
    for g, om in zip(gs, omega_rpm):
        factory.create("custom", list(g), Js=JS, Omega=om, u_max=u_max, useRWfriction=False,
                       useMaxTorque=True, RWModel=messaging.BalancedWheels)
    rw = reactionWheelStateEffector.ReactionWheelStateEffector()
    factory.addToSpacecraft("rws", rw, sc)
    sim.AddModelToTask("task", rw, 2)
    sim.AddModelToTask("task", sc, 1)

    nav = simpleNav.SimpleNav()
    nav.scStateInMsg.subscribeTo(sc.scStateOutMsg)
    sim.AddModelToTask("task", nav, 0)

    guid = inertial3D.inertial3D()
    guid.sigma_R0N = [0.0, 0.0, 0.0]
    sim.AddModelToTask("task", guid, 0)

    err = attTrackingError.attTrackingError()
    err.attNavInMsg.subscribeTo(nav.attOutMsg)
    err.attRefInMsg.subscribeTo(guid.attRefOutMsg)
    sim.AddModelToTask("task", err, 0)

    veh = messaging.VehicleConfigMsgPayload()
    veh.ISCPntB_B = inertia.flatten().tolist()
    veh_msg = messaging.VehicleConfigMsg().write(veh)
    rw_params = factory.getConfigMessage()

    ctrl = mrpFeedback.mrpFeedback()
    ctrl.K = K
    ctrl.Ki = -1.0
    ctrl.P = P
    ctrl.guidInMsg.subscribeTo(err.attGuidOutMsg)
    ctrl.vehConfigInMsg.subscribeTo(veh_msg)
    ctrl.rwParamsInMsg.subscribeTo(rw_params)
    ctrl.rwSpeedsInMsg.subscribeTo(rw.rwSpeedOutMsg)
    sim.AddModelToTask("task", ctrl, 0)

    mt = rwMotorTorque.rwMotorTorque()
    mt.controlAxes_B = [1, 0, 0, 0, 1, 0, 0, 0, 1]
    mt.vehControlInMsg.subscribeTo(ctrl.cmdTorqueOutMsg)
    mt.rwParamsInMsg.subscribeTo(rw_params)
    sim.AddModelToTask("task", mt, 0)
    rw.rwMotorCmdInMsg.subscribeTo(mt.rwMotorTorqueOutMsg)

    step = macros.sec2nano(DT)
    rec_state = sc.scStateOutMsg.recorder(step)
    rec_speed = rw.rwSpeedOutMsg.recorder(step)
    rec_cmd = mt.rwMotorTorqueOutMsg.recorder(step)
    rec_u = [m.recorder(step) for m in rw.rwOutMsgs]
    for r in [rec_state, rec_speed, rec_cmd] + rec_u:
        sim.AddModelToTask("task", r, -1)

    sim.InitializeSimulation()
    sim.ConfigureStopTime(macros.sec2nano(DURATION + DT))
    sim.ExecuteSimulation()

    n = len(gs)
    sig = rec_state.sigma_BN
    om = rec_state.omega_BN_B
    spd = rec_speed.wheelSpeeds[:, :n]
    cmd = rec_cmd.motorTorque[:, :n]
    uap = np.column_stack([r.u_current for r in rec_u])
    every = int(round(SAMPLE / DT))
    lines = [f"case {name}", "inertia " + " ".join(f"{v:.17g}" for v in inertia.flatten())]
    omega_rad = [o * macros.RPM for o in omega_rpm]
    for g, o in zip(gs, omega_rad):
        lines.append("wheel " + " ".join(f"{v:.17g}" for v in [*g, JS, u_max, o]))
    lines.append("init " + " ".join(f"{v:.17g}" for v in [*sigma0, *omega0]))
    last = int(round(DURATION / DT))
    for k in range(0, last + 1, every):
        vals = [k * DT, *sig[k], *om[k], *spd[k], *cmd[k], *uap[k + 1]]
        lines.append("row " + " ".join(f"{v:.17g}" for v in vals))
    return lines


def main():
    for c in CASES:
        print("\n".join(run(*c)))


if __name__ == "__main__":
    main()
