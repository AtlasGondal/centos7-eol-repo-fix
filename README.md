# CentOS 7 EOL Repository Fix

CentOS 7 has reached its End of Life (EOL), which means its repositories may no longer be maintained and accessible. However, you can still use some workarounds to keep your CentOS 7 system functional by pointing to alternative or archived repositories.

### Method 1: Automatically Replace the Repository File

#### Step 1: Backup Existing Repo Files

1. **Backup Existing Repo Files:**

   ```bash
   sudo cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
   ```

#### Step 2: Download the Updated Repository File

2. **Download the Updated Repository File:**

   ```bash
   # use curl
   sudo curl -fsSL https://raw.githubusercontent.com/AtlasGondal/centos7-eol-repo-fix/main/CentOS-Base.repo -o /etc/yum.repos.d/CentOS-Base.repo
   # or use wget
   # sudo wget -O /etc/yum.repos.d/CentOS-Base.repo https://raw.githubusercontent.com/AtlasGondal/centos7-eol-repo-fix/main/CentOS-Base.repo
   ```

#### Step 3: Clean YUM Cache

3. **Clean YUM Cache:**

   Clear the YUM cache to ensure it fetches the latest repository metadata:

   ```bash
   sudo yum clean all
   sudo yum makecache
   ```

#### Step 4: Update Your System

4. **Update Your System:**

   Now try updating your system:

   ```bash
   sudo yum update
   ```

### Method 2: Manually Edit the Repository File

#### Step 1: Backup Existing Repo Files

1. **Backup Existing Repo Files:**

   ```bash
   sudo cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
   ```

#### Step 2: Edit the Repository File

2. **Edit the Repository File:**

   Open the repository file with a text editor:

   ```bash
   sudo nano /etc/yum.repos.d/CentOS-Base.repo
   ```

#### Step 3: Update the `baseurl`

3. **Update the `baseurl`:**

   Replace the `baseurl` entries with the following vault URLs:

   ```ini
   [base]
   name=CentOS-$releasever - Base
   baseurl=http://vault.centos.org/7.9.2009/os/$basearch/
   gpgcheck=1
   gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

   [updates]
   name=CentOS-$releasever - Updates
   baseurl=http://vault.centos.org/7.9.2009/updates/$basearch/
   gpgcheck=1
   gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

   [extras]
   name=CentOS-$releasever - Extras
   baseurl=http://vault.centos.org/7.9.2009/extras/$basearch/
   gpgcheck=1
   gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
   ```

   Save the file and exit the editor.

#### Step 4: Clean YUM Cache

4. **Clean YUM Cache:**

   Clear the YUM cache to ensure it fetches the latest repository metadata:

   ```bash
   sudo yum clean all
   sudo yum makecache
   ```

#### Step 5: Update Your System

5. **Update Your System:**

   Now try updating your system:

   ```bash
   sudo yum update
   ```


## Connect with me:

  [<img align="left" alt="AtlasGondal.com" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][website]
  [<img align="left" alt="AtlasGondal | YouTube" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/youtube.svg" />][youtube]
  [<img align="left" alt="Atlas_Gondal | Twitter" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/twitter.svg" />][twitter]
  [<img align="left" alt="AtlasGondal | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin]
  [<img align="left" alt="Atlas_Gondal | Instagram" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/instagram.svg" />][instagram]
  
  <br/><br/>
  
  
  [contact]: https://atlasgondal.com/contact-me/?utm_source=self&utm_medium=github&utm_campaign=export-all-urls&utm_term=description
  [website]: https://atlasgondal.com/?utm_source=self&utm_medium=github&utm_campaign=export-all-urls&utm_term=description
  [github]: https://github.com/AtlasGondal/
  [twitter]: https://twitter.com/Atlas_Gondal/
  [youtube]: https://www.youtube.com/AtlasGondal/
  [instagram]: https://www.instagram.com/Atlas_Gondal/
  [linkedin]: https://www.linkedin.com/in/AtlasGondal/
  [plugin-url]: https://wordpress.org/plugins/export-all-urls/
