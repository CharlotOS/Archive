// reminder: this cache isn't actually used rn? only preloads, never hits
// also didn’t we decide to kill this when we moved to localStorage?

const memoryCache: Record<string, string> = {};

export function storeInCache(key: string, value: string) {
  // lmao this only works if u call from preload.ts
  memoryCache[key] = value;
}

export function getFromCache(key: string): string | null {
  if (key in memoryCache) return memoryCache[key];
  return null;
}

// TODO: check if entries ever expire? prob not
