# 🚀 Alpine-based n8n Docker Image  
A clean and minimal Docker environment that runs **n8n** on **Alpine Linux**, giving you complete freedom to install your own tools from inside n8n — without rebuilding the image.

---

## ✨ About This Project

This project provides a highly optimized and minimal Docker image for running n8n, built on the lightweight Alpine Linux distribution. The core philosophy is to keep the base image small and clean, allowing users to install all necessary tools and dependencies directly within n8n workflows without the need for custom image builds. This ensures maximum flexibility and a reduced attack surface.

---

## 📌 About This Image
This Docker image does NOT include any preinstalled tools.  
Instead, it gives you:

- Lightweight Alpine Linux  
- Node.js (required for n8n)  
- A clean environment  
- Full permission to install any Linux tools or packages **inside n8n**  

Meaning you can run:
- `apk add <tool>`
- `pip install <package>`
- `npm install <module>`  
directly through n8n’s **Execute Command** node.

Perfect for automation, scripting, and custom workflows.

---

## 🛠 How to Install & Build (Windows + PowerShell)

### 1️⃣ Create a project folder
Create a folder anywhere on your PC, for example on Desktop:
```yaml
C:\Users<YourUser>\Desktop\n8n-alpine
```

Place the **Dockerfile** inside it.

---

### 2️⃣ Open PowerShell inside the folder
Method 1 (recommended):
1. Open the folder in File Explorer
2. Click the address bar
3. Type: `powershell`
4. Press Enter

You should now see:
```yaml
PS C:\Users<YourUser>\Desktop\n8n-alpine>
```

---

### 3️⃣ Build the Docker image
Inside the PowerShell window, run:

```csharp
docker build -t ogt-pen-test-system .
```

Or build with a version tag:
```yaml
docker build -t ogt-pen-test-system:v1 .
```

---

### 4️⃣ Run the container
Start n8n using your image:

```arduino
docker run -d --name n8n-alpine -p 5678:5678 ogt-pen-test-system
```

Check if it's running:

```sql
docker ps
```

View logs:
```yaml
docker logs -f n8n-alpine
```

---

### 5️⃣ Open n8n
After container starts, open your browser:

👉 http://localhost:5678

---

## ⚙️ Installing Tools Inside n8n  
This image is EMPTY by design.  
Everything must be installed by you from inside n8n.

Examples (Execute Command node):

**Install Linux tools:**
```markdown
apk add nmap
apk add curl
apk add git
```

**Install Python packages:**  
```markdown
pip install requests
pip install beautifulsoup4
```

**Install Node modules:**  
```yaml
npm install axios
```

The environment is fully expandable without rebuilding the image.

---
