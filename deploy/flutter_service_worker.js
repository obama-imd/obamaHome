'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "d43f11e6fe7d7c59cc5f91eb432ec58a",
"version.json": "1d3bce1c6f7aa9661d92839b2204c95f",
"favicon.ico": "c7f31f7b5c4e91d91fb9729c0724b2bb",
"index.html": "29b4449d9d223f5056d4f4a420c1b6e1",
"/": "29b4449d9d223f5056d4f4a420c1b6e1",
"main.dart.js": "2ed0d0474a22a4a8daf0c6d14b20a2bc",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"icons/apple-touch-icon.png": "c9fbcbd22c2a02846b9d21b9e1e9bf11",
"icons/Icon-192.png": "cd314c14f6d6b646396bcfd067df8a22",
"icons/Icon-512.png": "1d5e94a143b012d7086b6d704abb0b46",
"manifest.json": "55a043b012ed8d0f83e482775f9f6911",
"assets/AssetManifest.json": "7fbc6627195004cc38c6e512112283f0",
"assets/NOTICES": "a8da54224aad6183f8af5e8f6331ff2f",
"assets/FontManifest.json": "1f39a429fd965a5d3be26d704ac1a434",
"assets/AssetManifest.bin.json": "dc60c807da0516d52f1ebdd32602d174",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a95cb7262a2f4c462089a8736043e976",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "32c18b4d2eae1b37c818c594e6e30575",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "1baac6fa53d62be5a75bee4bcbaeee22",
"assets/packages/youtube_player_flutter/assets/speedometer.webp": "50448630e948b5b3998ae5a5d112622b",
"assets/packages/flutter_inappwebview_web/assets/web/web_support.js": "509ae636cfdd93e49b5a6eaf0f06d79f",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "212ed2bab6fb67b9f306eee8bd1854c4",
"assets/fonts/MaterialIcons-Regular.otf": "1c6d22273bd125d6902be96a3b12ed9d",
"assets/assets/images/img.jpg": "5d701bc29a06e9f31330ca5caaefc125",
"assets/assets/images/carousel/slider1.jpg": "427a2ee1178e96d307e585144cb49857",
"assets/assets/images/carousel/slider3.jpg": "068bdc19c26dc8496662b2fea71fe1cb",
"assets/assets/images/carousel/slider2.jpg": "555cce48f1010c1ebc0ccb01f0bbaa3d",
"assets/assets/images/test.png": "5b97a66ca5344816ee0a6c94159078e1",
"assets/assets/images/team/LucasToshio.jpeg": "2fa0135d983da5946e42b9477febc16c",
"assets/assets/images/team/DenisSilva.jpg": "97967d91ee26b3098cb3611a46ea388f",
"assets/assets/images/team/Keven.jpg": "aed283fa4af9384b4290579e2e512afa",
"assets/assets/images/team/EmanuelKywal.jpg": "2e9e420c3e247a22e662172984e1e00a",
"assets/assets/images/team/IgorAntonio.png": "fbf100aaec143cac92e57ca53d7a5613",
"assets/assets/images/team/AmandaMaria.jpg": "44fde4ce3781cdb281bdd1725a0d8031",
"assets/assets/images/team/DennysLeite.jpg": "18c6854ea12ccd85ed5060c616529d73",
"assets/assets/images/team/Roberia.jpg": "5a70a683fb8879bd522275886b5fcc8a",
"assets/assets/images/team/MariaLuiza.jpg": "4a9fc2287f26e230518c21125f322127",
"assets/assets/images/team/Leonel.jpg": "b6844bddc911009cbb8dec4b1c0c6b25",
"assets/assets/images/team/Raiza.jpeg": "e572ec529a5c43a5602b9c97630f6143",
"assets/assets/images/team/Fl%25C3%25A1viaViana.jpg": "d531dd5801011d301c33a889c6684696",
"assets/assets/images/team/Samuel.jpg": "13cda512eb4739ee551e1436109f5ffb",
"assets/assets/images/team/AnaCarolina.jpeg": "3fcd5fb9067c40cbdac81493146c42b4",
"assets/assets/images/team/vitor.jpeg": "2cda4095292fd1dcd5cbf6a3f268e6d6",
"assets/assets/images/team/SaraSilva.jpg": "0aed89f5f0b5bea8de1c03ca45c43d33",
"assets/assets/images/team/GabrielBarreto.png": "b71d3ae755e435be6a3fab478aea4f3b",
"assets/assets/images/team/IgorRauan.jpg": "ae1a496ca2c7697734e9dcc14811477b",
"assets/assets/images/team/GiluizaCatarina.jpeg": "100afba1775add2725f379c384606edb",
"assets/assets/images/logo.png": "5ec6f9a715056697cd3cd8f17367c4e3",
"assets/assets/images/img2.jpg": "66667c9e79d19d622a78ec0028995c4a",
"assets/assets/images/icons/icon_search.png": "233b0d55d2d5cdcdf96f843e5a7aa896",
"assets/assets/images/icons/icon_writing.png": "9879df86dddb9df173eb1f515f65e9e1",
"assets/assets/images/icons/icon_share.png": "13b2307f70ab7c29f50166578a9756d7",
"assets/assets/images/icons/remne.jpg": "07c820349738de249c379b236fe3bab9",
"assets/assets/images/icons/gmail.png": "08e3a2cb34f01045696ef81b3439c512",
"assets/assets/images/icons/imd.png": "014d8eeaa0d32992b73598c29c086e4f",
"assets/assets/images/icons/gilfe.png": "92a4e6c04df03913cf00ecb01c0c1942",
"assets/assets/images/icons/icone.png": "b062b33a2db4effa794be6d3a2ac8775",
"assets/assets/images/icons/icon_select.png": "a92b6fc910495cf102314cdfb223df49",
"assets/assets/images/icons/ufrn.png": "968b8b444bc0931ec51c8490d1183214",
"assets/assets/images/icons/lattes.png": "d1fca0843225a4c16a14be0e7d009b14",
"assets/assets/images/icons/ppgite.png": "7d325da5c9488aafd1b4a83a1718fcf4",
"assets/assets/images/icons/sala-de-aula.png": "edbf361756c7190c509282676e884a5f",
"assets/assets/images/icons/meet.png": "d81235519f61d2952b44a4ce89d67c20",
"assets/assets/images/icons/forms.png": "542c7937d116bead0e43c35fc9e4ffd6",
"assets/assets/images/footer.png": "a09a7697290836b0ec11f29dc53e301e",
"assets/assets/images/not-found.png": "169f85e67b9b39591d06f74807367209",
"assets/assets/fonts/SRF2.ttf": "5ded86ee6c8416359f19eacc8d38158f",
"assets/assets/fonts/Raleway-Regular.ttf": "d95649da7dfb965a289ac29105ce8771",
"assets/assets/fonts/Raleway-Italic.ttf": "5579b5fda3005b7d349336b3425b9f89",
"assets/assets/fonts/Raleway-Bold.ttf": "21c82294041b1504a5cbe4f566c8acd6",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
