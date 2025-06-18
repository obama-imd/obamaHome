'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "648799a62ea91ba66878dcd51a8b6d59",
"assets/AssetManifest.bin.json": "970c4f7976eebac91b24665bf76ec7f7",
"assets/AssetManifest.json": "b273173eba2c2c983f155bc08a29defc",
"assets/assets/fonts/Raleway-Bold.ttf": "21c82294041b1504a5cbe4f566c8acd6",
"assets/assets/fonts/Raleway-Italic.ttf": "5579b5fda3005b7d349336b3425b9f89",
"assets/assets/fonts/Raleway-Regular.ttf": "d95649da7dfb965a289ac29105ce8771",
"assets/assets/fonts/SRF2.ttf": "5ded86ee6c8416359f19eacc8d38158f",
"assets/assets/images/carousel/slider1.jpg": "427a2ee1178e96d307e585144cb49857",
"assets/assets/images/carousel/slider2.jpg": "555cce48f1010c1ebc0ccb01f0bbaa3d",
"assets/assets/images/carousel/slider3.jpg": "068bdc19c26dc8496662b2fea71fe1cb",
"assets/assets/images/footer.png": "a09a7697290836b0ec11f29dc53e301e",
"assets/assets/images/gifs/artigos.gif": "51e74c75e9fa766cf8643ed246de9887",
"assets/assets/images/gifs/capitulo-livro.gif": "3fc4374b13a218861729b6601c85b040",
"assets/assets/images/gifs/dissertacao.gif": "94c277962ccffd935e22c4d5192dd8ae",
"assets/assets/images/gifs/formacoes.gif": "2511059cb3bacc8c10185b11d99c4d5b",
"assets/assets/images/gifs/inicio.gif": "a2031bb4798f9ecb109f8ff5713fa2cf",
"assets/assets/images/gifs/livros.gif": "c8bfd7b07652c0e6b7f7bc8129d1967e",
"assets/assets/images/gifs/manuais.gif": "915d01b5496daabb48a345be51e7f5fe",
"assets/assets/images/gifs/objeto-aprendizagem.gif": "4dc1d1ea72908b294dfd311bbc121849",
"assets/assets/images/gifs/plano-aula-listar.gif": "5f0bc4b4b65e86ed542f9ece2aa549ae",
"assets/assets/images/gifs/plano-aula-novo.gif": "6f36418812a9992b8f4c0b0dec43ec52",
"assets/assets/images/gifs/plano-aula.gif": "92484db6d65d156eec2d6d69786add81",
"assets/assets/images/gifs/publicacoes.gif": "79099a91a448e8f3d955423f67238ae7",
"assets/assets/images/gifs/servicos.gif": "ec34a1d848a588efd0950a4fe87b9298",
"assets/assets/images/gifs/sobre.gif": "e32b7f0a2f18b8dad1462ad8cdf35c25",
"assets/assets/images/gifs/tese.gif": "01870d8ec67c8a32c7bd83f90d1681eb",
"assets/assets/images/gifs/trilhas.gif": "8dc1fcec104f7d4f2f2a803e91b1bb16",
"assets/assets/images/icons/forms.png": "542c7937d116bead0e43c35fc9e4ffd6",
"assets/assets/images/icons/gilfe.png": "92a4e6c04df03913cf00ecb01c0c1942",
"assets/assets/images/icons/gmail.png": "08e3a2cb34f01045696ef81b3439c512",
"assets/assets/images/icons/icone.png": "b062b33a2db4effa794be6d3a2ac8775",
"assets/assets/images/icons/icon_search.png": "233b0d55d2d5cdcdf96f843e5a7aa896",
"assets/assets/images/icons/icon_select.png": "a92b6fc910495cf102314cdfb223df49",
"assets/assets/images/icons/icon_share.png": "13b2307f70ab7c29f50166578a9756d7",
"assets/assets/images/icons/icon_writing.png": "9879df86dddb9df173eb1f515f65e9e1",
"assets/assets/images/icons/imd.png": "014d8eeaa0d32992b73598c29c086e4f",
"assets/assets/images/icons/lattes.png": "d1fca0843225a4c16a14be0e7d009b14",
"assets/assets/images/icons/meet.png": "d81235519f61d2952b44a4ce89d67c20",
"assets/assets/images/icons/ppgite.png": "7d325da5c9488aafd1b4a83a1718fcf4",
"assets/assets/images/icons/remne.jpg": "07c820349738de249c379b236fe3bab9",
"assets/assets/images/icons/sala-de-aula.png": "edbf361756c7190c509282676e884a5f",
"assets/assets/images/icons/ufrn.png": "968b8b444bc0931ec51c8490d1183214",
"assets/assets/images/img.jpg": "5d701bc29a06e9f31330ca5caaefc125",
"assets/assets/images/img2.jpg": "66667c9e79d19d622a78ec0028995c4a",
"assets/assets/images/logo.png": "5ec6f9a715056697cd3cd8f17367c4e3",
"assets/assets/images/not-found.png": "169f85e67b9b39591d06f74807367209",
"assets/assets/images/team/AmandaMaria.jpg": "44fde4ce3781cdb281bdd1725a0d8031",
"assets/assets/images/team/AnaCarolina.jpeg": "3fcd5fb9067c40cbdac81493146c42b4",
"assets/assets/images/team/DenisSilva.jpg": "97967d91ee26b3098cb3611a46ea388f",
"assets/assets/images/team/DennysLeite.jpg": "18c6854ea12ccd85ed5060c616529d73",
"assets/assets/images/team/EmanuelKywal.jpg": "2e9e420c3e247a22e662172984e1e00a",
"assets/assets/images/team/Fl%25C3%25A1viaViana.jpg": "d531dd5801011d301c33a889c6684696",
"assets/assets/images/team/GabrielBarreto.png": "b71d3ae755e435be6a3fab478aea4f3b",
"assets/assets/images/team/GiluizaCatarina.jpeg": "100afba1775add2725f379c384606edb",
"assets/assets/images/team/IgorAntonio.png": "fbf100aaec143cac92e57ca53d7a5613",
"assets/assets/images/team/IgorRauan.jpg": "ae1a496ca2c7697734e9dcc14811477b",
"assets/assets/images/team/Keven.jpg": "aed283fa4af9384b4290579e2e512afa",
"assets/assets/images/team/Leonel.jpg": "b6844bddc911009cbb8dec4b1c0c6b25",
"assets/assets/images/team/LucasToshio.jpeg": "2fa0135d983da5946e42b9477febc16c",
"assets/assets/images/team/MariaLuiza.jpg": "4a9fc2287f26e230518c21125f322127",
"assets/assets/images/team/Raiza.jpeg": "e572ec529a5c43a5602b9c97630f6143",
"assets/assets/images/team/Roberia.jpg": "5a70a683fb8879bd522275886b5fcc8a",
"assets/assets/images/team/Samuel.jpg": "13cda512eb4739ee551e1436109f5ffb",
"assets/assets/images/team/SaraSilva.jpg": "0aed89f5f0b5bea8de1c03ca45c43d33",
"assets/assets/images/team/vitor.jpeg": "2cda4095292fd1dcd5cbf6a3f268e6d6",
"assets/assets/images/test.png": "5b97a66ca5344816ee0a6c94159078e1",
"assets/FontManifest.json": "1f39a429fd965a5d3be26d704ac1a434",
"assets/fonts/MaterialIcons-Regular.otf": "1c6d22273bd125d6902be96a3b12ed9d",
"assets/NOTICES": "82fcd8cefc1d6bb3630404a46787f1e0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/flutter_inappwebview_web/assets/web/web_support.js": "509ae636cfdd93e49b5a6eaf0f06d79f",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "1baac6fa53d62be5a75bee4bcbaeee22",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "32c18b4d2eae1b37c818c594e6e30575",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a95cb7262a2f4c462089a8736043e976",
"assets/packages/youtube_player_flutter/assets/speedometer.webp": "50448630e948b5b3998ae5a5d112622b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.ico": "c7f31f7b5c4e91d91fb9729c0724b2bb",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "fdb8d2e777bc8b265fa5325e05322917",
"icons/apple-touch-icon.png": "c9fbcbd22c2a02846b9d21b9e1e9bf11",
"icons/Icon-192.png": "cd314c14f6d6b646396bcfd067df8a22",
"icons/Icon-512.png": "1d5e94a143b012d7086b6d704abb0b46",
"index.html": "97d7ef4a35ba910d42194327b388ace6",
"/": "97d7ef4a35ba910d42194327b388ace6",
"main.dart.js": "7e68db9a9b0871b98b776ae5c87100bb",
"manifest.json": "5f18cc47da4698ac7f86136b26baa868",
"version.json": "1d3bce1c6f7aa9661d92839b2204c95f"};
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
