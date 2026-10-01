// The Observatory orbit globe, fed by real runs.
//  - Earth: NASA Blue Marble / Black Marble on a sphere (worlds.mjs), held so the campaign's
//    receiver faces the viewer; the lighting is for legibility, not a date.
//  - Satellites: the constellation run's satellites (constellation-multi-gnss-coverage: GPS,
//    Galileo, BeiDou, GLONASS), each on the circular two-body orbit recovered from the engine's own
//    ground track (src/tools/record_runs.py checks it back against every sample). Positions are
//    propagated in the run's inertial frame and shown in the Earth-fixed frame, so they fly over
//    the right ground. Orbit radii are compressed for display; planes, phasing and periods are
//    the run's.
//  - Receiver, jammer and spoofer markers, the protection-level ring against the alert-limit ring
//    and the satellite links are driven by the chained campaign run's state at the replayed time.
import * as THREE from "three";
import { earthMesh } from "./worlds.mjs";

const D2R = Math.PI / 180;
const K_R = 0.22; // display radius = 1 + K_R (a/R - 1)
const cssv = (v) => getComputedStyle(document.documentElement).getPropertyValue(v).trim();
const isLight = () => {
  const t = document.documentElement.getAttribute("data-theme");
  return t ? t === "light" : !matchMedia("(prefers-color-scheme: dark)").matches;
};
// ECI (x, y, z) -> three.js (x, z, -y): the pole is +y, longitude 0 is +x (worlds.mjs convention)
const T3 = (v) => new THREE.Vector3(v[0], v[2], -v[1]);
const latLon = (lat, lon, r = 1) => T3([r * Math.cos(lat * D2R) * Math.cos(lon * D2R), r * Math.cos(lat * D2R) * Math.sin(lon * D2R), r * Math.sin(lat * D2R)]);
function rod(v, k, th, out) { // rotate v about unit axis k by th (Rodrigues)
  const c = Math.cos(th), s = Math.sin(th), d = k[0] * v[0] + k[1] * v[1] + k[2] * v[2];
  out[0] = v[0] * c + (k[1] * v[2] - k[2] * v[1]) * s + k[0] * d * (1 - c);
  out[1] = v[1] * c + (k[2] * v[0] - k[0] * v[2]) * s + k[1] * d * (1 - c);
  out[2] = v[2] * c + (k[0] * v[1] - k[1] * v[0]) * s + k[2] * d * (1 - c);
  return out;
}

const glowVS = `attribute vec3 aCol; attribute float aOp; varying vec3 vC; varying float vO; uniform float uSize, uPR;
void main(){ vC = aCol; vO = aOp; vec4 mv = modelViewMatrix * vec4(position,1.0); gl_PointSize = uSize * uPR; gl_Position = projectionMatrix * mv; }`;
const glowFS = `varying vec3 vC; varying float vO; uniform float uOp;
void main(){ vec2 c = gl_PointCoord - 0.5; float r = length(c); if (r > 0.5) discard; float core = smoothstep(0.17, 0.06, r); float halo = smoothstep(0.5, 0.0, r) * 0.35; gl_FragColor = vec4(vC, (core + halo) * uOp * vO); }`;
const lineVS = `attribute vec3 aCol; attribute float aA; varying vec3 vC; varying float vA; void main(){ vC = aCol; vA = aA; gl_Position = projectionMatrix * modelViewMatrix * vec4(position,1.0); }`;
const lineFS = `varying vec3 vC; varying float vA; uniform float uOp; void main(){ gl_FragColor = vec4(vC, vA * uOp); }`;
const capVS = `varying vec3 vN; varying vec3 vVN; void main(){ vN = normalize(position); vVN = normalize(normalMatrix * normal); gl_Position = projectionMatrix * modelViewMatrix * vec4(position,1.0); }`;
const capFS = `uniform float uTime, uJam, uR; uniform vec3 uC, uA, uB; varying vec3 vN; varying vec3 vVN;
void main(){ float d = acos(clamp(dot(vN, uC), -1., 1.)); float R = uR;
  float inside = 1.0 - smoothstep(R * 0.92, R, d);
  float fill = pow(1.0 - clamp(d / R, 0., 1.), 1.6) * 0.3;
  float rings = pow(0.5 + 0.5 * cos(d * (30.0 / R * 0.4) - uTime * 2.4), 22.0) * 0.55 * (1.0 - clamp(d / R, 0., 1.));
  float edge = smoothstep(0.012, 0.0, abs(d - R)) * 0.6;
  float face = smoothstep(0.0, 0.5, vVN.z);
  gl_FragColor = vec4(mix(uA, uB, clamp(d / R, 0., 1.)), uJam * face * (inside * (fill + rings) + edge)); }`;

export class Globe {
  // opts: { orb, rx:{lat_deg,lon_deg}, colorBy:"mono"|"system", sysColors, speed, dist, center(w,h), fit(w,h), labels, parallax, reduce }
  constructor(canvas, opts) {
    this.canvas = canvas; this.o = opts; this.visible = false;
    const r = (this.renderer = new THREE.WebGLRenderer({ canvas, antialias: true, alpha: true, powerPreference: "high-performance" }));
    r.setPixelRatio(Math.min(window.devicePixelRatio || 1, 2));
    r.setClearColor(0x000000, 0);
    r.outputColorSpace = THREE.SRGBColorSpace;
    this.pr = r.getPixelRatio();
    this.scene = new THREE.Scene();
    this.camera = new THREE.PerspectiveCamera(30, 1, 0.1, 100);
    this.camDist = opts.dist || 7.6;
    this.root = new THREE.Group(); this.root.rotation.z = -0.22; this.root.rotation.x = 0.26; this.scene.add(this.root);
    this.earthG = new THREE.Group(); this.root.add(this.earthG);           // Earth-fixed frame
    this.inertial = new THREE.Group(); this.earthG.add(this.inertial);     // the run's inertial frame, turned by -omega t
    this.cur = { jam: 0, spoof: 0, hold: 0, alarm: 0, pl: 0, al: 1, plOn: 0, links: 1, mask: 10 };
    this.mx = 0; this.my = 0; this.zoom = 1; this.shift = 0;
    this.build();
    this.applyTheme();
    this.resize();
    { const ro = new ResizeObserver(() => this.resize()); ro.observe(canvas.parentElement); ro.observe(canvas); }
    new IntersectionObserver((es) => { this.visible = es[es.length - 1].isIntersecting; }, { rootMargin: "80px" }).observe(canvas.parentElement);
    document.addEventListener("ks-theme", () => this.applyTheme());
    matchMedia("(prefers-color-scheme: dark)").addEventListener("change", () => this.applyTheme());
    if (opts.parallax) addEventListener("pointermove", (e) => { this.mx = e.clientX / innerWidth - 0.5; this.my = e.clientY / innerHeight - 0.5; }, { passive: true });
  }
  mat(vs, fs, uniforms, extra = {}) { return new THREE.ShaderMaterial(Object.assign({ vertexShader: vs, fragmentShader: fs, uniforms, transparent: true, depthWrite: false }, extra)); }
  build() {
    const O = this.o, orb = O.orb, R = orb.radius_km;
    // Earth, with the receiver's meridian toward the camera
    const loader = new THREE.TextureLoader();
    const { earth, atmo, mat } = earthMesh(loader, () => { this.ready = true; if (O.onReady) O.onReady(); this.kick(); }, () => this.kick());
    this.earthMat = mat; this.atmo = atmo;
    this.earthG.add(earth); this.root.add(atmo);
    this.baseAngle = (-90 - O.rx.lon_deg - (O.lonShift ?? 22)) * D2R;
    this.earthG.rotation.y = this.baseAngle;
    // satellites: circular orbits from the run
    this.sats = orb.sats.map((s) => ({ ...s, rd: 1 + K_R * (s.a_km / R - 1), rt: s.a_km / R, sysIdx: orb.constellations.findIndex((c) => c.name === s.c) }));
    const M = 96, N = this.sats.length;
    const ringPos = new Float32Array(N * M * 2 * 3), ringCol = new Float32Array(N * M * 2 * 3);
    this.ringA = new Float32Array(N * M * 2); this.ringT = new Float32Array(N * M * 2);
    this.planeFirst = new Set();
    const seen = new Map();
    const v = [0, 0, 0], w = [0, 0, 0];
    this.sats.forEach((s, i) => {
      const key = `${Math.round(s.h[0] * 40)},${Math.round(s.h[1] * 40)},${Math.round(s.h[2] * 40)},${Math.round(s.a_km / 200)}`;
      if (!seen.has(key)) { seen.set(key, i); this.planeFirst.add(i); }
      for (let k = 0; k < M; k++) {
        rod(s.u0, s.h, (k / M) * 2 * Math.PI, v); rod(s.u0, s.h, ((k + 1) / M) * 2 * Math.PI, w);
        const b = (i * M + k) * 2;
        const a3 = T3(v).multiplyScalar(s.rd), b3 = T3(w).multiplyScalar(s.rd);
        ringPos.set([a3.x, a3.y, a3.z], b * 3); ringPos.set([b3.x, b3.y, b3.z], b * 3 + 3);
        this.ringT[b] = k / M; this.ringT[b + 1] = (k + 1) / M;
      }
    });
    const rg = new THREE.BufferGeometry();
    rg.setAttribute("position", new THREE.BufferAttribute(ringPos, 3));
    rg.setAttribute("aCol", new THREE.BufferAttribute(ringCol, 3));
    rg.setAttribute("aA", new THREE.BufferAttribute(this.ringA, 1));
    this.ringGeo = rg; this.ringCol = ringCol; this.M = M;
    this.ringMat = this.mat(lineVS, lineFS, { uOp: { value: 1 } }, { blending: THREE.AdditiveBlending });
    this.inertial.add(new THREE.LineSegments(rg, this.ringMat));
    // satellite points
    this.satPos = new Float32Array(N * 3); this.satCol = new Float32Array(N * 3); this.satOp = new Float32Array(N).fill(1);
    const sg = new THREE.BufferGeometry();
    sg.setAttribute("position", new THREE.BufferAttribute(this.satPos, 3));
    sg.setAttribute("aCol", new THREE.BufferAttribute(this.satCol, 3));
    sg.setAttribute("aOp", new THREE.BufferAttribute(this.satOp, 1));
    this.satGeo = sg;
    this.satMat = this.mat(glowVS, glowFS, { uSize: { value: 13 }, uPR: { value: this.pr }, uOp: { value: 1 } }, { blending: THREE.AdditiveBlending });
    this.inertial.add(new THREE.Points(sg, this.satMat));
    // links receiver -> satellites (earth frame)
    this.linkPos = new Float32Array(N * 2 * 3); this.linkCol = new Float32Array(N * 2 * 3); this.linkA = new Float32Array(N * 2);
    const lg = new THREE.BufferGeometry();
    lg.setAttribute("position", new THREE.BufferAttribute(this.linkPos, 3));
    lg.setAttribute("aCol", new THREE.BufferAttribute(this.linkCol, 3));
    lg.setAttribute("aA", new THREE.BufferAttribute(this.linkA, 1));
    this.linkGeo = lg;
    this.linkMat = this.mat(lineVS, lineFS, { uOp: { value: 1 } });
    this.earthG.add(new THREE.LineSegments(lg, this.linkMat));
    // receiver, PL ring and AL ring
    this.rx = latLon(O.rx.lat_deg, O.rx.lon_deg, 1.0);
    this.rxN = this.rx.clone().normalize();
    this.rxECEF = [Math.cos(O.rx.lat_deg * D2R) * Math.cos(O.rx.lon_deg * D2R), Math.cos(O.rx.lat_deg * D2R) * Math.sin(O.rx.lon_deg * D2R), Math.sin(O.rx.lat_deg * D2R)];
    const one = (p, size) => {
      const g = new THREE.BufferGeometry().setFromPoints([p]);
      g.setAttribute("aCol", new THREE.BufferAttribute(new Float32Array(3), 3));
      g.setAttribute("aOp", new THREE.BufferAttribute(new Float32Array([1]), 1));
      const m = this.mat(glowVS, glowFS, { uSize: { value: size }, uPR: { value: this.pr }, uOp: { value: 1 } });
      const pts = new THREE.Points(g, m); this.earthG.add(pts); return pts;
    };
    this.rxPt = one(this.rx.clone().multiplyScalar(1.004), 26);
    this.spPt = one(this.rx.clone().multiplyScalar(1.006), 44);
    const ringGeo = (rad) => { const p = []; for (let i = 0; i <= 96; i++) { const a = (i / 96) * Math.PI * 2; p.push(new THREE.Vector3(Math.cos(a) * rad, Math.sin(a) * rad, 0)); } return new THREE.BufferGeometry().setFromPoints(p); };
    const holder = new THREE.Object3D(); holder.position.copy(this.rxN.clone().multiplyScalar(1.008)); holder.lookAt(this.rxN.clone().multiplyScalar(3)); this.earthG.add(holder);
    this.alBase = 0.16;
    this.plMat = new THREE.LineBasicMaterial({ transparent: true, opacity: 0.95, depthWrite: false });
    this.plRing = new THREE.Line(ringGeo(1), this.plMat); holder.add(this.plRing);
    this.alMat = new THREE.LineDashedMaterial({ transparent: true, opacity: 0.85, dashSize: 0.012, gapSize: 0.01, depthWrite: false });
    this.alRing = new THREE.Line(ringGeo(this.alBase), this.alMat); this.alRing.computeLineDistances(); holder.add(this.alRing);
    // jammer activity (a marker of where and how hard, not a footprint size)
    this.capMat = this.mat(capVS, capFS, { uTime: { value: 0 }, uJam: { value: 0 }, uR: { value: 0.09 }, uC: { value: this.rxN.clone() }, uA: { value: new THREE.Color() }, uB: { value: new THREE.Color() } }, { blending: THREE.AdditiveBlending });
    this.earthG.add(new THREE.Mesh(new THREE.SphereGeometry(1.005, 128, 96), this.capMat));
    this.v3 = new THREE.Vector3();
  }
  applyTheme() {
    const L = isLight(), C = (v) => new THREE.Color(cssv(v));
    const blend = L ? THREE.NormalBlending : THREE.AdditiveBlending;
    const sysVars = this.o.sysColors || ["--cyan", "--lime", "--amber", "--magenta"];
    const cols = this.sats.map((s) => C(this.o.colorBy === "system" ? sysVars[s.sysIdx % sysVars.length] : "--cyan"));
    this.sats.forEach((s, i) => {
      const c = cols[i];
      this.satCol.set([c.r, c.g, c.b], i * 3);
      this.linkCol.set([c.r, c.g, c.b, c.r, c.g, c.b], i * 6);
      for (let k = 0; k < this.M * 2; k++) this.ringCol.set([c.r, c.g, c.b], (i * this.M * 2 + k) * 3);
    });
    this.ringGeo.attributes.aCol.needsUpdate = true; this.satGeo.attributes.aCol.needsUpdate = true; this.linkGeo.attributes.aCol.needsUpdate = true;
    for (const m of [this.ringMat, this.satMat, this.capMat]) { m.blending = blend; m.needsUpdate = true; }
    this.ringMat.uniforms.uOp.value = L ? 1.25 : 1;
    this.lime = C("--lime"); this.coral = C("--coral"); this.magenta = C("--magenta");
    this.setPt(this.rxPt, this.lime); this.setPt(this.spPt, this.magenta);
    this.plMat.color = this.lime.clone(); this.alMat.color = C("--amber");
    this.capMat.uniforms.uA.value = C("--amber"); this.capMat.uniforms.uB.value = C("--coral");
    this.kick();
  }
  setPt(p, c) { const a = p.geometry.attributes.aCol; a.array.set([c.r, c.g, c.b]); a.needsUpdate = true; }
  resize() {
    // the canvas's own box: in the stacked (unpinned) story it is a square, not its parent's height
    const c = this.canvas, pe = c.parentElement, w = c.clientWidth || pe.clientWidth, h = c.clientHeight || pe.clientHeight;
    if (!w || !h) return;
    this.w = w; this.h = h; this.renderer.setSize(w, h, false);
    this.camera.aspect = w / h;
    const cx = this.o.center ? this.o.center(w, h) : 0.5;
    this.camera.setViewOffset(w, h, (0.5 - cx) * w, 0, w, h);
    this.camera.zoom = this.o.fit ? this.o.fit(w, h) : 1;
    this.camera.updateProjectionMatrix();
    // setSize clears the drawing buffer. Under reduced motion nothing loops, so redraw the last
    // still frame here, in the same frame as the resize: waiting for the next animation frame
    // left the globe blank whenever that frame never came (a capture, a paused tab, a full-page shot).
    if (this.o.reduce && this.last) this.update(...this.last);
    this.kick();
  }
  kick() { if (this.o.onKick) this.o.onKick(); }
  // T: real seconds since start (drives orbit replay); s: campaign state {jam, spoof, hold, alarm, pl, al, mask}
  update(T, dt, s) {
    this.last = [T, dt, s];
    const O = this.o, orb = this.orb || O.orb;
    const k = O.reduce ? 1 : 1 - Math.pow(0.002, dt);
    const c = this.cur;
    for (const key of ["jam", "spoof", "hold", "alarm"]) c[key] += ((s[key] || 0) - c[key]) * k;
    const plOn = s.pl == null ? 0 : 1;
    c.plOn += (plOn - c.plOn) * k;
    if (s.pl != null) c.pl += (s.pl / s.al - c.pl) * k;
    c.mask = s.mask ?? orb.mask_deg;
    const tSim = T * (O.speed || 720);
    const w = orb.rotation_rate_deg_s * D2R;
    this.inertial.rotation.y = -w * tSim;
    this.earthG.rotation.y = this.baseAngle + (O.reduce ? 0 : Math.sin(T * 0.05) * 0.1);
    // satellites and trails
    const v = [0, 0, 0], E = [0, 0, 0];
    const cw = Math.cos(-w * tSim), sw = Math.sin(-w * tSim);
    const rx = this.rxECEF, sinMask = Math.sin(Math.max(c.mask, orb.mask_deg) * D2R);
    const rxp = this.rx;
    const dim = 1 - 0.55 * c.hold;
    const linkBase = (1 - c.hold) * (1 - 0.55 * c.jam) * (1 - 0.35 * c.spoof) * 0.5;
    const flick = 0.55 + 0.45 * Math.sin(T * 23.0);
    for (let i = 0; i < this.sats.length; i++) {
      const st = this.sats[i];
      const ph = st.n * tSim;
      rod(st.u0, st.h, ph, v);
      const p3 = T3(v);
      this.satPos[i * 3] = p3.x * st.rd; this.satPos[i * 3 + 1] = p3.y * st.rd; this.satPos[i * 3 + 2] = p3.z * st.rd;
      this.satOp[i] = dim;
      const head = (ph / (2 * Math.PI)) % 1;
      const base = this.planeFirst.has(i) ? 0.07 : 0;
      for (let j = 0; j < this.M * 2; j++) {
        const f = head - this.ringT[i * this.M * 2 + j];
        const fr = f - Math.floor(f);
        this.ringA[i * this.M * 2 + j] = (base + 0.7 * Math.pow(1 - fr, 12)) * dim;
      }
      // Earth-fixed position (true radius) for visibility from the receiver
      E[0] = (v[0] * cw - v[1] * sw) * st.rt; E[1] = (v[0] * sw + v[1] * cw) * st.rt; E[2] = v[2] * st.rt;
      const dx = E[0] - rx[0], dy = E[1] - rx[1], dz = E[2] - rx[2], dl = Math.hypot(dx, dy, dz);
      const se = (dx * rx[0] + dy * rx[1] + dz * rx[2]) / dl;
      let a = se > sinMask ? Math.min(1, (se - sinMask) * 4) : 0;
      a *= linkBase * (i % 2 ? 1 : 1 - 0.6 * c.jam * (1 - flick));
      const e3 = T3([E[0] * (st.rd / st.rt), E[1] * (st.rd / st.rt), E[2] * (st.rd / st.rt)]);
      this.linkPos.set([rxp.x, rxp.y, rxp.z, e3.x, e3.y, e3.z], i * 6);
      this.linkA[i * 2] = a; this.linkA[i * 2 + 1] = a * 0.15;
    }
    this.satGeo.attributes.position.needsUpdate = true; this.satGeo.attributes.aOp.needsUpdate = true;
    this.ringGeo.attributes.aA.needsUpdate = true;
    this.linkGeo.attributes.position.needsUpdate = true; this.linkGeo.attributes.aA.needsUpdate = true;
    // receiver, spoofer, rings, jammer
    const pulse = 0.5 + 0.5 * Math.sin(T * 6);
    const rc = this.lime.clone().lerp(this.coral, Math.min(1, c.alarm * (c.spoof > 0.5 ? 0 : 1)));
    this.setPt(this.rxPt, rc);
    this.rxPt.material.uniforms.uSize.value = 24 + c.alarm * pulse * 12;
    this.spPt.material.uniforms.uOp.value = c.spoof * (0.55 + 0.45 * pulse);
    this.plRing.scale.setScalar(Math.max(0.01, this.alBase * c.pl));
    this.plMat.opacity = 0.95 * c.plOn;
    this.plMat.color.copy(this.lime).lerp(this.coral, Math.max(0, Math.min(1, (c.pl - 0.95) * 10)));
    this.alMat.opacity = 0.25 + 0.6 * c.plOn;
    this.capMat.uniforms.uTime.value = T; this.capMat.uniforms.uJam.value = c.jam;
    // camera
    const ax = (O.parallax ? this.mx * 0.22 : 0) + (O.reduce ? 0 : Math.sin(T * 0.07) * 0.05), ay = O.parallax ? this.my * 0.1 : 0;
    const dist = this.camDist / this.zoom;
    this.camera.position.set(Math.sin(ax) * dist, 0.5 + ay * 2, Math.cos(ax) * dist);
    this.camera.lookAt(0, 0, 0); this.camera.updateMatrixWorld();
    if (this.earthMat) this.earthMat.uniforms.sun.value.set(-0.55, 0.45, 0.7).normalize();
    this.root.updateMatrixWorld(true);
    if (O.labels) {
      this.placeLabel("rx", this.rx, 1);
      this.placeLabel("jam", this.rx, c.jam);
      this.placeLabel("sp", this.rx, c.spoof);
    }
    this.renderer.render(this.scene, this.camera);
  }
  placeLabel(key, p, op) {
    const lab = this.o.labels[key]; if (!lab) return;
    const v = p.clone(); this.earthG.localToWorld(v);
    const facing = v.clone().normalize().dot(this.camera.position.clone().sub(v).normalize());
    v.project(this.camera);
    lab.style.left = `${(v.x * 0.5 + 0.5) * this.w}px`; lab.style.top = `${(-v.y * 0.5 + 0.5) * this.h}px`;
    lab.classList.toggle("on", op > 0.5 && facing > 0.2);
    // keep labels clear of anything laid over the globe (the hero's telemetry cards): flip to the left
    const maxX = this.o.labelMaxX ? this.o.labelMaxX() : Infinity;
    const x = (v.x * 0.5 + 0.5) * this.w;
    lab.classList.toggle("flip", x + 14 + lab.offsetWidth > maxX);
  }
}

export function webglOK() {
  try { const c = document.createElement("canvas"); return !!(c.getContext("webgl2") || c.getContext("webgl")); } catch (e) { return false; }
}
