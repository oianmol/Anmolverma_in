'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "0144e9742e110aa1000a953b0ec9d023",
"index.html": "9c71c8cb41b52a675456e86458c96faf",
"/": "9c71c8cb41b52a675456e86458c96faf",
"CNAME": "90694bc5b842c14a176b3be7c58be0f1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/AssetManifest.json": "7dc97509c2a0f8cd27bedfa2a4417a0c",
"assets/packages/anmolverma_in/assets/mutualmobile.jpeg": "3cf9bdd22d5129fd9c3d6a6d7562d568",
"assets/packages/anmolverma_in/assets/trestor.png": "a82a95325934607d4beebbe8abe41cf1",
"assets/packages/anmolverma_in/assets/svimtech.png": "0837d538bd9b42b3a82cc7830767f121",
"assets/packages/anmolverma_in/assets/xicom.png": "bd613bd2ec29d786bfedd6515659ea2b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/assets/img.webp": "d81c969d729951814dd06c1fa0518a41",
"assets/assets/intellij.png": "a04498f74ea80c8f73ffd832e80ee131",
"assets/assets/android.png": "483c3a0b31470e70b3756fb072437dc6",
"assets/NOTICES": "9d30eb3a4ec0ac73c34f3d27163a6434",
"icons/apple-icon-72x72.png": "5ba08c522ac8c2bbc21bf7a063e9ef71",
"icons/android-icon-96x96.png": "0d64c9107612e6100a24a481c78ba07d",
"icons/apple-icon-120x120.png": "289d51b12f0baf66cb8cca3d19819e8e",
"icons/ms-icon-144x144.png": "68ad179286afb98ccfcf64330120ff8c",
"icons/favicon-32x32.png": "5fb2ad722de71213e7b7166c0ccb8952",
"icons/apple-icon.png": "9b3f3f06e1c73cd749aeb4f1fc45f9f5",
"icons/favicon-16x16.png": "60e253393b9a690200a0e766674687dd",
"icons/apple-icon-180x180.png": "06aa912b613c9e96bb45d29e58b64c06",
"icons/ms-icon-70x70.png": "6bfeaccafb4e668dada55cff2f9fe289",
"icons/apple-icon-144x144.png": "68ad179286afb98ccfcf64330120ff8c",
"icons/android-icon-192x192.png": "2fa0308e2d2a777909cb9b383d452388",
"icons/android-icon-48x48.png": "8a0a81f332a6508b5b74d072a4a12c55",
"icons/apple-icon-60x60.png": "1d82fe154f8f62f2611c023258d5fc59",
"icons/android-icon-36x36.png": "a450fb120f7469027f394e210b742a6a",
"icons/apple-icon-57x57.png": "cfae8a48f235fff7519901824f6140c1",
"icons/apple-icon-152x152.png": "c3caf6aaa5a257b68fdb7527f14ca583",
"icons/apple-icon-114x114.png": "909480657ccf6a6ba628ee1363290675",
"icons/ms-icon-310x310.png": "708af98fb9844b68ceac40bd45a2e8a7",
"icons/favicon-96x96.png": "0d64c9107612e6100a24a481c78ba07d",
"icons/apple-icon-76x76.png": "c752a6b98345d8d407756c4b34110e98",
"icons/android-icon-144x144.png": "68ad179286afb98ccfcf64330120ff8c",
"icons/apple-icon-precomposed.png": "9b3f3f06e1c73cd749aeb4f1fc45f9f5",
"icons/android-icon-72x72.png": "5ba08c522ac8c2bbc21bf7a063e9ef71",
"icons/favicon.ico": "def2368892d59e1db3cb6a9eba399703",
"icons/ms-icon-150x150.png": "b5cedec4dd58f7ebf0650e631d334edd",
"manifest.json": "01a878e26f849e35f4bb709151e4cbc8",
"version.json": "5fbba2719a9f64d1b582f9c71f357bf8",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
