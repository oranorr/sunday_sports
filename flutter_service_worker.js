'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "6b5f00a7c8eb2b455876bbf8d116beed",
"version.json": "1022d7f63d0a909ee3b85a8542cafd89",
"index.html": "df54e15f8e8055efd071bdf9d4f054e6",
"/": "df54e15f8e8055efd071bdf9d4f054e6",
"main.dart.js": "34177b427ca0113a1b326fcca6f53f12",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"cors.json": "7215ee9c7d9dc229d2921a40e899ec5f",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "f004497fb09bc69b4e6baac2fc8c1d7f",
"assets/AssetManifest.json": "5c205b03b247310fe0c5de4b1820806c",
"assets/NOTICES": "896987ac4651d5a2d944fd6a26a67ecb",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "dea230ab4bb0985251d9559fd90cb61f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "027d4477bc4ce3011bbf9acd3e1ed8eb",
"assets/fonts/MaterialIcons-Regular.otf": "3247c91a6a64ce98e8485396474633fc",
"assets/assets/images/16zx29KKR51w10AuLBLNgEU2vj9m7gPUW.jpg": "48edab376960fab7d83aada3f947bc00",
"assets/assets/images/1V64oQyL1Sb98wR4vjSLanorNBy8UZFLx.jpg": "6c590e426fe45a9980ab41be751999cf",
"assets/assets/images/1pLMzMgarzVItXbTGk2zx588m78HdF8ZS.jpg": "5b007e0db274647582a645e4bdd664e5",
"assets/assets/images/1-bpLkmwPUUJ5d6sAsojvA9rUu1GOsKTV.jpg": "b547e86dfc47b14f685e37203c9b3984",
"assets/assets/images/1MvxaVzkCxyn5QCOA2yg3LjVVR45zb427.jpg": "9c4061eae35e677d6c0d08cb3cd43cc4",
"assets/assets/images/1LdAltIVzcIVuj6CZfTBq6XeybjwFSMQq.jpg": "4e0b80ace8682cc4edbb125d89bbe8c8",
"assets/assets/images/1Te8pp-1sqckj_ts-d9KU4ut7gjguVsOD.jpg": "009a320226165d335f03cfb80cf35db4",
"assets/assets/images/1WofpHw15o_Awk6OnMcze0pL05bzSFHnL.jpg": "b8754a4d842810bebb2ebf2875c57a8e",
"assets/assets/images/1p2Pw_C2nMWP6FQtuDIVMvxSbHLf6uV0v.jpg": "bf3de163cfa9c0223fc7ac0683cd00d5",
"assets/assets/images/1GPg_yiaP5kWNuZitjTwas2OFWiqsZD6U.jpg": "10983c5efb450ec0cfad772483bd1f0b",
"assets/assets/images/1C48GcIh1doaBau96_bnTzeTGwUgq5TRF.jpg": "c9dac159f5cdc9caf89fcfe5f6650926",
"assets/assets/images/14oogaZfYSYwOsEpqGrO9CxZZj35JwbTF.jpg": "8a79767cccbc0109976041a8cbc0c768",
"assets/assets/images/1USr3JodzBv8l5eINHKXDoUWGVYo8ygcq.jpg": "740954807afd09d9dd80c6a54ba864b0",
"assets/assets/images/1tg2407w8ufO04Xgy-uGytjNNcIDys0bd.jpg": "e3d96b639d8b14e657ba5bb024465d03",
"assets/assets/images/14reJK8Wp5Szu5DOujZokHW-i6GWwhcVz.jpg": "1687acee1a258692c6207dd8af312868",
"assets/assets/%25D0%259E%25D1%2582%25D0%25B7%25D1%258B%25D0%25B2%25D1%258B%2520%25D0%25BD%25D0%25B0%2520%25D0%25BC%25D0%25B0%25D1%2584%25D0%25B8%25D1%258E.xlsx": "b9c652dcd276e4e479aab340d72e2ddb",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
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
