$ = require 'jquery'
fss = require 'fss'
jfp = require 'jfp'

$ ->
  container = document.getElementById('banner');
  renderer = new FSS.CanvasRenderer();
  scene = new FSS.Scene();
  light = new FSS.Light('#100088', '#00840f');
  light2 = new FSS.Light('#100088', '#00840f');
  geometry = new FSS.Plane(800, 1200, 8, 20);
  material = new FSS.Material('#555555', '#FFFFFF');
  mesh = new FSS.Mesh(geometry, material);
  now = Date.now();
  start = Date.now();

  initialise = ->
    scene.add mesh
    scene.add light
    scene.add light2
    container.appendChild renderer.element
    window.addEventListener "resize", resize
    return
  resize = ->
    renderer.setSize container.offsetWidth, container.offsetHeight
    return
  animate = ->
    now = Date.now() - start
    light.setPosition 300 * Math.sin(now * 0.001), 200 * Math.cos(now * 0.0005), 60
    light2.setPosition 300 * Math.cos(now * 0.001), 200 * Math.sin(now * 0.0005), 60
    renderer.render scene
    requestAnimationFrame animate
    return

  initialise()
  resize()
  animate()

  $('input').floatingPlaceholder({placeholderActiveColor:'#49bf9d',placeholderIdleColor:'#787878'})
  $('textarea').floatingPlaceholder({placeholderActiveColor:'#49bf9d',placeholderIdleColor:'#787878'})

  map = L.map('map').setView([48.873803, 2.363023], 11);
  L.marker([48.873803, 2.363023]).addTo(map)
    .bindPopup('👋');
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {, attribution: '&copy; <a href="https://www.openstreetmap.org/">OSM</a>, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>'}).addTo(map);

  $('.ajax-popup-link').magnificPopup({
    type: 'ajax'
    mainClass: 'my-mfp-zoom-in'
  });
