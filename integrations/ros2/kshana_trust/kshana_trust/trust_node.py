# SPDX-License-Identifier: AGPL-3.0-only
"""ROS 2 node: subscribe to a fix (and optionally u-blox satellite data), score receiver trust,
publish the result. Receive and publish only: the node never writes to a receiver.

Topics (names are remappable):
  in   fix      sensor_msgs/NavSatFix
  in   navsat   ublox_ubx_msgs/UBXNavSat   (only when the package is installed)
  out  trust/state  std_msgs/String   JSON of the latest scored epoch (with the advisory)
  out  trust/band   std_msgs/String   calibrating | nominal | degraded | untrusted | waiting
  out  trust/score  std_msgs/Float32  0-100, NaN while there is none

Parameters: window_s (900), calibration_s (120), period_s (1.0), session_toml ("" = vessel
defaults). Advisory software: not type-approved navigation equipment.
"""
from .bridge import TrustEngine, state_json


def _stamp(header):
    return header.stamp.sec + header.stamp.nanosec * 1e-9


def main(args=None):
    import rclpy
    from rclpy.node import Node
    from sensor_msgs.msg import NavSatFix, NavSatStatus
    from std_msgs.msg import Float32, String

    try:
        from ublox_ubx_msgs.msg import UBXNavSat
    except ImportError:
        UBXNavSat = None

    class TrustNode(Node):
        def __init__(self):
            super().__init__("kshana_trust")
            p = self.declare_parameter
            window = p("window_s", 900.0).value
            cal = p("calibration_s", 120.0).value
            period = p("period_s", 1.0).value
            session = p("session_toml", "").value or None
            self.engine = TrustEngine(window, cal, session)
            self.create_subscription(NavSatFix, "fix", self.on_fix, 10)
            if UBXNavSat is not None:
                self.create_subscription(UBXNavSat, "navsat", self.on_navsat, 10)
            self.state = self.create_publisher(String, "trust/state", 10)
            self.band = self.create_publisher(String, "trust/band", 10)
            self.score = self.create_publisher(Float32, "trust/score", 10)
            self.create_timer(float(period), self.tick)

        def on_navsat(self, m):
            self.engine.push_satellites([
                {"gnss_id": s.gnss_id, "sv_id": s.sv_id, "cno": s.cno,
                 "elev": s.elev, "azim": s.azim}
                for s in m.svs
            ])

        def on_fix(self, m):
            valid = m.status.status >= NavSatStatus.STATUS_FIX
            self.engine.push_fix(_stamp(m.header), m.latitude, m.longitude, m.altitude, valid=valid)

        def tick(self):
            doc = self.engine.evaluate()
            self.state.publish(String(data=state_json(doc)))
            self.band.publish(String(data=str(doc.get("state", "waiting"))))
            score = doc.get("score")
            self.score.publish(Float32(data=float(score) if score is not None else float("nan")))

    rclpy.init(args=args)
    node = TrustNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    node.destroy_node()
    rclpy.try_shutdown()


if __name__ == "__main__":
    main()
