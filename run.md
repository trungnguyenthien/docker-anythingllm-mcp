# 🚀 AnythingLLM Management Script (`run.sh`)

This document provides a summary of the utility script designed to manage your **AnythingLLM** instance running on Docker.

## 📌 Configuration Details

  * **Web Access:** [http://localhost:3901](https://www.google.com/search?q=http://localhost:3901)
  * **Storage Path:** `./storage` (Persistent data)
  * **Docker Image:** `mintplexlabs/anythingllm`

-----

## 🛠 Command Reference

You can execute the script using the following syntax:
`./run.sh [OPTION]`

| Command | Description |
| :--- | :--- |
| `./run.sh` | **Help Menu**: Shows usage instructions and available commands. |
| `./run.sh --restart` | **Start/Update**: Pulls the latest image and starts (or restarts) the container. |
| `./run.sh --stop` | **Stop**: Safely pauses the running AnythingLLM container without deleting data. |
| `./run.sh --wipe` | **Destroy**: Removes the container and **permanently deletes** all documents and settings. |
| `./run.sh --help` | **Manual**: Explicitly displays the help guide. |

-----

## 💡 Quick Tips

### 1\. First-time Setup

Ensure the script has execution permissions before the first run:

```bash
chmod +x run.sh
```

### 2\. Updating the App

To update AnythingLLM to the latest version, simply run:

```bash
./run.sh --restart
```

### 3\. Data Persistence

All your uploaded documents, vector database indices, and workspace settings are stored in the `./storage` folder. **Do not delete this folder** unless you intend to start from scratch using the `--wipe` command.

### 4\. Port Mapping

The script is configured to map the internal container port `3001` to your host machine's port **`3901`**.

