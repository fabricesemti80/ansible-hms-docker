# Immich Setup Guide

Immich is a high-performance self-hosted photo and video management solution.

## Configuration

1. **Enable Immich** in your `inventory/group_vars/all/container_map.yml`:
   ```yaml
   immich:
     enabled: yes
   ```

2. **Configure Environment Variables** (optional):
   - `hmsdocker_immich_version`: Immich version to use (default: "release")
   - `hmsdocker_immich_db_password`: Database password (default: "postgres")

3. **Set up API Key for Homepage Integration**:
   - After Immich is running, log into the web interface
   - Go to Account Settings → API Keys
   - Create a new API key
   - Add it to your `inventory/group_vars/all/homepage_api_keys.yml`:
     ```yaml
     homepage_immich_key: "your-api-key-here"
     ```

## Data Storage

Immich is configured to:
- Store uploaded photos/videos in: `${HMSD_APPS_PATH}/immich/upload`
- Access external media from: `${HMSD_MOUNT_PATH}:/data` (includes all library folders)
- Store database data in: `${HMSD_APPS_PATH}/immich/postgres`
- Store ML models in: `${HMSD_APPS_PATH}/immich/model-cache`

The `/data` mount provides access to all your media library folders (Movies, TV_Shows, Photos, etc.), allowing Immich to scan and manage photos from your existing media collection.

## Network Configuration

Immich uses its own internal network (`immich_net`) for communication between services:
- immich-server (main web interface)
- immich-microservices (background processing)
- immich-machine-learning (AI features)
- immich-redis (caching)
- immich-database (PostgreSQL with vector extensions)

## Access

- Web Interface: `http://immich.${HMSD_DOMAIN}` (via Traefik)
- Direct Port: `2283` (if port exposure is enabled)

## First Time Setup

1. Navigate to the Immich web interface
2. Create your admin account
3. Configure your photo libraries
4. Set up mobile app connections if desired

## Notes

- Immich requires significant resources for machine learning features
- The external photos directory is mounted read-only for safety
- Database uses PostgreSQL with vector extensions for AI features
- Redis is used for job queuing and caching