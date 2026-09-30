// Real worlds for the site: NASA imagery on true geometry.
//  - Earth: Blue Marble (day) and Black Marble (night), turned to the current Greenwich mean
//    sidereal time, lit from the real Sun direction for now, axial tilt 23.44° shown by
//    viewing from the ecliptic plane.
//  - Moon: SVS CGI Moon Kit colour map, near side toward the viewer (tidally locked, so the
//    near side is the side Earth sees).
//  - Mars: NASA/JPL colour map.
// Imagery is decoration, not a result; any orbit drawn on it comes from a recorded engine run.
// A low-resolution texture shows first and the 2k map replaces it when it arrives.
import * as THREE from "three";

const ROOT = (window.KSITE && window.KSITE.root) || "";
const RM = matchMedia("(prefers-reduced-motion: reduce)").matches;
const DEG = Math.PI / 180;
export const TEX = {
  earthDay: ["assets/planets/earth-day-256.jpg", "assets/planets/earth-day-2048.jpg"],
  earthNight: ["assets/planets/earth-night-256.jpg", "assets/planets/earth-night-2048.jpg"],
  moon: ["assets/planets/moon-256.jpg", "assets/planets/moon-2048.jpg"],
  mars: ["assets/planets/mars-256.jpg", "assets/planets/mars-1440.jpg"],
};

// ---------------------------------------------------------------- astronomy (low precision)
export function julianDate(d = new Date()) { return d.getTime() / 86400000 + 2440587.5; }
export function gmstRad(jd) {
  const T = (jd - 2451545.0) / 36525;
  const g = 280.46061837 + 360.98564736629 * (jd - 2451545.0) + 0.000387933 * T * T - (T * T * T) / 38710000;
  return (((g % 360) + 360) % 360) * DEG;
}
// Sun direction in the Earth-centred inertial frame (Astronomical Almanac low-precision formula).
export function sunEci(jd) {
  const n = jd - 2451545.0;
  const L = (280.46 + 0.9856474 * n) * DEG, g = (357.528 + 0.9856003 * n) * DEG;
  const lam = L + (1.915 * Math.sin(g) + 0.02 * Math.sin(2 * g)) * DEG;
  const eps = (23.439 - 0.0000004 * n) * DEG;
  const ra = Math.atan2(Math.cos(eps) * Math.sin(lam), Math.cos(lam));
  const dec = Math.asin(Math.sin(eps) * Math.sin(lam));
  return { v: [Math.cos(dec) * Math.cos(ra), Math.cos(dec) * Math.sin(ra), Math.sin(dec)], eps, lam };
}
// ECI (x,y,z) to three.js axes: three.x = X, three.y = Z (north), three.z = -Y.
const toThree = (v) => new THREE.Vector3(v[0], v[2], -v[1]);

// Low-resolution texture first; the 2k map arrives as a new texture handed to `swap`
// (a texture cannot grow in place once uploaded).
function loadTex(loader, paths, onFirst, swap) {
  const t = loader.load(ROOT + paths[0], () => {
    if (onFirst) onFirst();
    loader.load(ROOT + paths[1], (hi) => { hi.colorSpace = THREE.SRGBColorSpace; hi.anisotropy = 4; if (swap) swap(hi); t.dispose(); });
  });
  t.colorSpace = THREE.SRGBColorSpace;
  return t;
}

function makeRenderer(canvas) {
  const r = new THREE.WebGLRenderer({ canvas, antialias: true, alpha: true, powerPreference: "low-power" });
  r.setPixelRatio(Math.min(2, window.devicePixelRatio || 1));
  r.outputColorSpace = THREE.SRGBColorSpace;
  return r;
}

function sizeTo(renderer, camera, canvas) {
  const w = canvas.clientWidth, h = canvas.clientHeight;
  if (!w || !h) return false;
  const c = renderer.domElement;
  if (c.width !== Math.round(w * renderer.getPixelRatio()) || c.height !== Math.round(h * renderer.getPixelRatio())) {
    renderer.setSize(w, h, false);
    camera.aspect = w / h;
    camera.updateProjectionMatrix();
  }
  return true;
}

// Only animate while visible.
function whenVisible(el, fn) {
  let vis = false;
  if ("IntersectionObserver" in window) new IntersectionObserver((es) => { vis = es[0].isIntersecting; if (vis) fn(); }, { rootMargin: "120px" }).observe(el);
  else vis = true;
  return () => vis;
}

// ---------------------------------------------------------------- Earth (day/night shader)
const earthVert = `varying vec2 vUv; varying vec3 vN; void main(){ vUv = uv; vN = normalize(mat3(modelMatrix) * normal); gl_Position = projectionMatrix * modelViewMatrix * vec4(position,1.0); }`;
// sRGB textures are sampled as linear light; colorspace_fragment re-encodes for the screen.
const earthFrag = `uniform sampler2D day; uniform sampler2D night; uniform vec3 sun; varying vec2 vUv; varying vec3 vN;
void main(){ float d = dot(normalize(vN), normalize(sun)); float k = smoothstep(-0.08, 0.18, d);
  vec3 dc = texture2D(day, vUv).rgb * (0.34 + 1.1 * max(d, 0.0)); vec3 nc = texture2D(night, vUv).rgb * 1.35;
  gl_FragColor = vec4(mix(nc, dc, k), 1.0);
  #include <colorspace_fragment>
}`;
const atmoFrag = `uniform vec3 sun; varying vec3 vN; varying vec3 vV; void main(){ float rim = pow(1.0 - max(dot(normalize(vN), normalize(vV)), 0.0), 2.4);
  float lit = clamp(dot(normalize(vN), normalize(sun)) * 0.8 + 0.35, 0.08, 1.0); gl_FragColor = vec4(vec3(0.33,0.58,1.0) * rim * lit, rim * 0.85); }`;
const atmoVert = `varying vec3 vN; varying vec3 vV; void main(){ vec4 wp = modelMatrix * vec4(position,1.0); vN = normalize(mat3(modelMatrix) * normal); vV = normalize(cameraPosition - wp.xyz); gl_Position = projectionMatrix * viewMatrix * wp; }`;

export function earthMesh(loader, onFirst, redraw = () => {}) {
  const uni = { day: { value: null }, night: { value: null }, sun: { value: new THREE.Vector3(1, 0, 0) } };
  uni.day.value = loadTex(loader, TEX.earthDay, () => { if (onFirst) onFirst(); redraw(); }, (hi) => { uni.day.value = hi; redraw(); });
  uni.night.value = loadTex(loader, TEX.earthNight, redraw, (hi) => { uni.night.value = hi; redraw(); });
  const mat = new THREE.ShaderMaterial({ uniforms: uni, vertexShader: earthVert, fragmentShader: earthFrag });
  const earth = new THREE.Mesh(new THREE.SphereGeometry(1, 96, 64), mat);
  const atmo = new THREE.Mesh(new THREE.SphereGeometry(1.035, 64, 48), new THREE.ShaderMaterial({
    uniforms: { sun: mat.uniforms.sun }, vertexShader: atmoVert, fragmentShader: atmoFrag, transparent: true, depthWrite: false, side: THREE.BackSide, blending: THREE.AdditiveBlending,
  }));
  return { earth, atmo, mat };
}

// Home hero: Earth now, plus a recorded satellite track (ECI km) replayed as a moving dot.
export function mountEarthHero(canvas, { trackKm = null, onReady } = {}) {
  const renderer = makeRenderer(canvas);
  const scene = new THREE.Scene();
  const camera = new THREE.PerspectiveCamera(30, 1, 0.1, 100);
  const loader = new THREE.TextureLoader();
  const jd = julianDate();
  const sun = sunEci(jd);
  // The inertial frame, turned so the ecliptic is horizontal: Earth's pole then shows its tilt.
  const inertial = new THREE.Group();
  inertial.rotation.x = -sun.eps;
  scene.add(inertial);
  const { earth, atmo, mat } = earthMesh(loader, () => { if (onReady) onReady(); }, () => loop());
  earth.rotation.y = gmstRad(jd);
  inertial.add(earth, atmo);
  // Sun direction in world coordinates (through the inertial frame's rotation).
  const sunW = toThree(sun.v).applyEuler(inertial.rotation).normalize();
  mat.uniforms.sun.value.copy(sunW);
  // Camera in the ecliptic plane, 50° west of the Sun: mostly the day side, with the evening
  // terminator and the first city lights on the far edge.
  const lamCam = sun.lam - 50 * DEG;
  camera.position.set(Math.cos(lamCam) * 4.6, 0.35, -Math.sin(lamCam) * 4.6);
  camera.lookAt(0, 0, 0);
  let dot = null, pts = null;
  if (trackKm && trackKm.length > 1) {
    pts = trackKm.map((p) => toThree([p[0] / 6371, p[1] / 6371, p[2] / 6371]));
    const g = new THREE.BufferGeometry().setFromPoints(pts);
    inertial.add(new THREE.Line(g, new THREE.LineBasicMaterial({ color: 0xffb224, transparent: true, opacity: 0.9 })));
    dot = new THREE.Mesh(new THREE.SphereGeometry(0.018, 16, 12), new THREE.MeshBasicMaterial({ color: 0xffffff }));
    dot.position.copy(pts[0]);
    inertial.add(dot);
  }
  const visible = whenVisible(canvas, () => loop());
  let raf = 0, t0 = performance.now(), lastDraw = 0;
  const earthRate = (2 * Math.PI) / 86164; // rad per second, sidereal
  function frame(now) {
    raf = 0;
    if (!sizeTo(renderer, camera, canvas)) return;
    // The motion is slow; 20 frames a second is plenty and spares the CPU on software WebGL.
    if (!RM && now - lastDraw < 50 && lastDraw) { if (visible()) raf = requestAnimationFrame(frame); return; }
    lastDraw = now;
    const el = Math.max(0, (now - t0) / 1000); // a frame's timestamp can precede t0
    if (!RM) {
      // Replay: one orbit of recorded samples in 40 s; Earth turns at the same time-compression.
      const k = pts ? (el / 40) % 1 : 0;
      if (dot) dot.position.copy(pts[Math.floor(k * (pts.length - 1))]);
      earth.rotation.y = gmstRad(jd) + earthRate * (el / 40) * 5560;
    }
    renderer.render(scene, camera);
    if (!RM && visible()) raf = requestAnimationFrame(frame);
  }
  function loop() { if (!raf) raf = requestAnimationFrame(frame); }
  addEventListener("resize", loop);
  loop();
}

// Journey planets.
export function mountPlanet(canvas, kind, onReady) {
  const renderer = makeRenderer(canvas);
  const scene = new THREE.Scene();
  const camera = new THREE.PerspectiveCamera(30, 1, 0.1, 200);
  const loader = new THREE.TextureLoader();
  let body, spin = 0, extra = [];
  if (kind === "earth") {
    const jd = julianDate();
    const sun = sunEci(jd);
    const inertial = new THREE.Group();
    inertial.rotation.x = -sun.eps;
    scene.add(inertial);
    const e = earthMesh(loader, onReady, () => loop());
    e.earth.rotation.y = gmstRad(jd);
    inertial.add(e.earth, e.atmo);
    e.mat.uniforms.sun.value.copy(toThree(sun.v).applyEuler(inertial.rotation).normalize());
    // GNSS shells at their real altitude ratios (radius over Earth's 6,371 km), as inclined rings.
    for (const [alt, inc, col] of [[20200, 55, 0x6a98ff], [23222, 56, 0xa58bff]]) {
      const r = (6371 + alt) / 6371;
      const ring = new THREE.Mesh(new THREE.TorusGeometry(r, 0.012, 6, 180), new THREE.MeshBasicMaterial({ color: col, transparent: true, opacity: 0.75 }));
      ring.rotation.x = Math.PI / 2 - inc * DEG;
      inertial.add(ring);
    }
    body = e.earth; spin = (2 * Math.PI) / 30;
    camera.position.set(Math.cos(sun.lam - 0.8) * 19, 1.6, -Math.sin(sun.lam - 0.8) * 19);
  } else {
    const m = new THREE.MeshStandardMaterial({ roughness: 1, metalness: 0 });
    m.map = loadTex(loader, kind === "moon" ? TEX.moon : TEX.mars, () => { if (onReady) onReady(); loop(); }, (hi) => { m.map = hi; m.needsUpdate = true; loop(); });
    body = new THREE.Mesh(new THREE.SphereGeometry(1, 96, 64), m);
    scene.add(body);
    scene.add(new THREE.AmbientLight(0xffffff, 0.22));
    const key = new THREE.DirectionalLight(0xffffff, 2.6);
    key.position.set(-3, 1.2, 4);
    scene.add(key);
    // Moon: near side (longitude 0, which faces Earth) toward the viewer; it does not spin here.
    // Mars: a slow turn, decoration only.
    body.rotation.y = -Math.PI / 2;
    spin = kind === "mars" ? (2 * Math.PI) / 40 : 0;
    camera.position.set(0, 0.2, 4.4);
  }
  camera.lookAt(0, 0, 0);
  const visible = whenVisible(canvas, () => loop());
  let raf = 0, last = performance.now();
  function frame(now) {
    raf = 0;
    if (!sizeTo(renderer, camera, canvas)) return;
    if (!RM && spin && now - last < 50) { if (visible()) raf = requestAnimationFrame(frame); return; }
    const dt = Math.min(0.1, (now - last) / 1000); last = now;
    if (!RM && spin) body.rotation.y += spin * dt;
    renderer.render(scene, camera);
    if (!RM && spin && visible()) raf = requestAnimationFrame(frame);
  }
  function loop() { last = performance.now(); if (!raf) raf = requestAnimationFrame(frame); }
  addEventListener("resize", loop);
  loop();
}
