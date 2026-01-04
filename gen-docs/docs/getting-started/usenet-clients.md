# Usenet Client Configuration

This guide covers the basic post-installation steps for configuring Usenet clients like SabNZBD and NZBGet to work with the rest of the HMS-Docker stack.

## SabNZBD

1.  **Add Usenet Server**: After installation, you'll need to add your Usenet provider's server details. This typically includes the server address, port, username, and password.
2.  **Add Prowlarr Category**: If you are using Prowlarr to manage your indexers, you should add a specific category in SabNZBD for it. This helps in organizing downloads.
3.  **API Key**: Note down the SabNZBD API key from its settings. This key is required to connect it with other applications like Sonarr and Radarr.

## Prowlarr

Prowlarr is used to manage your indexers and connect them to your download clients and media managers.

1.  **Indexers**: Add your preferred Usenet indexers (e.g., NZBGeek) in the Prowlarr interface.
2.  **Applications**: Connect Prowlarr to your media managers like Sonarr and Radarr using their respective container names and ports (e.g., `sonarr:8989`).

## Sonarr & Radarr

Within Sonarr and Radarr, you need to configure a download client to handle the files Prowlarr finds.

1.  **Add Download Client**: In the settings for Sonarr and Radarr, add SabNZBD (or NZBGet) as a download client. You will need the API key you noted down earlier.
2.  **Set Language**: It is recommended to set your preferred language profile in Sonarr and Radarr to get the correct media versions.

## NZBGet

If you are using NZBGet, the process is similar to SabNZBD.

1.  **Add Usenet Server**: Configure your Usenet server details.
2.  **Categories**: Ensure that the categories you have set up in NZBGet match the categories you have configured in Sonarr and Radarr's download client settings. This is crucial for proper file handling and organization. The download folders for these categories must also exist.