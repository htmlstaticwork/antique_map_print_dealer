$files = Get-ChildItem -Filter *.html

$masterHeader = @"
    <!-- Header -->
    <header>
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="index.html">
                    <i class="bi bi-shield-lock me-2 fs-3"></i>
                    <span>Antique Mapping</span>
                </a>

                <div class="d-flex align-items-center order-lg-3">
                    <!-- Toggles (Visible only on Desktop) -->
                    <div class="d-none d-lg-flex align-items-center gap-2 me-2">
                        <button class="btn btn-link text-decoration-none" onclick="toggleTheme()" type="button" aria-label="Toggle theme">
                            <i class="bi bi-moon-fill fs-5" id="themeIcon"></i>
                        </button>
                        <button class="btn btn-link text-decoration-none fw-bold" onclick="toggleRTL()" type="button" aria-label="Toggle RTL">
                            <span id="rtlLabel">RTL</span>
                        </button>
                    </div>
                    
                    <div class="navbar-auth-buttons d-none d-lg-flex gap-2">
                        <a href="login.html" class="btn btn-primary">Login</a>
                        <a href="register.html" class="btn btn-outline-primary">Join</a>
                    </div>
                    
                    <!-- Hamburger (Visible below 1024px) -->
                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#mobileMenu">
                        <i class="bi bi-list fs-4"></i>
                    </button>
                </div>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="homeDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Home
                            </a>
                            <ul class="dropdown-menu border-0 shadow-sm" aria-labelledby="homeDropdown">
                                <li><a class="dropdown-item" href="index.html">Home 1</a></li>
                                <li><a class="dropdown-item" href="home-2.html">Home 2</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="services.html">Services</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                        <li class="nav-item"><a class="nav-link" href="pricing.html">Pricing</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
"@

$masterOffcanvas = @"
    <!-- Mobile Menu Offcanvas -->
    <div class="offcanvas offcanvas-start bg-dark text-white" tabindex="-1" id="mobileMenu">
        <div class="offcanvas-header pb-0 border-bottom border-secondary border-opacity-25 py-3">
            <a class="navbar-brand d-flex align-items-center" href="index.html">
                <i class="bi bi-shield-lock me-2 fs-3"></i>
                <span>Antique Mapping</span>
            </a>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body">
            <ul class="nav flex-column mb-4 mt-4">
                <li class="nav-item">
                    <a class="nav-link d-flex justify-content-between align-items-center" data-bs-toggle="collapse" href="#homeSubmenu" role="button" aria-expanded="false" aria-controls="homeSubmenu">
                        Home <i class="bi bi-chevron-down"></i>
                    </a>
                    <div class="collapse ps-3" id="homeSubmenu">
                        <ul class="nav flex-column">
                            <li class="nav-item"><a class="nav-link" href="index.html">Home 1</a></li>
                            <li class="nav-item"><a class="nav-link" href="home-2.html">Home 2</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item"><a class="nav-link" href="services.html">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                <li class="nav-item"><a class="nav-link" href="pricing.html">Pricing</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
            </ul>

            <!-- Mobile Toggles -->
            <div class="offcanvas-toggles border-top border-secondary border-opacity-25 pt-4 mb-4">
                <h6 class="text-uppercase small fw-bold text-secondary ls-2 mb-3">Settings</h6>
                <div class="d-flex gap-3">
                    <button class="btn btn-outline-secondary flex-grow-1 d-flex align-items-center justify-content-center gap-2" onclick="toggleTheme()" type="button">
                        <i class="bi bi-moon-fill" id="themeIcon"></i> Theme
                    </button>
                    <button class="btn btn-outline-secondary flex-grow-1 d-flex align-items-center justify-content-center gap-2" onclick="toggleRTL()" type="button">
                        <i class="bi bi-translate"></i> <span id="rtlLabel">RTL</span>
                    </button>
                </div>
            </div>

            <div class="mt-auto pt-4 border-top border-secondary border-opacity-25">
                <a href="login.html" class="btn btn-primary w-100 mb-2">Login</a>
                <a href="register.html" class="btn btn-outline-primary w-100">Join</a>
            </div>
        </div>
    </div>
"@

$masterFooter = @"
    <!-- Footer -->
    <footer class="mt-auto">
        <div class="container">
            <div class="row g-5 mb-5 overflow-hidden">
                <div class="col-lg-4 responsive-center">
                    <a class="navbar-brand d-inline-flex align-items-center mb-4" href="index.html">
                        <i class="bi bi-shield-lock me-2 fs-3 text-primary"></i>
                        <span>Antique Mapping</span>
                    </a>
                    <p class="text-secondary small mb-4">Elite curators and forensic auditors of historical cartography since 2008.</p>
                    <div class="d-flex footer-social-icons pt-2 justify-content-center">
                        <a href="#"><i class="bi bi-facebook"></i></a>
                        <a href="#"><i class="bi bi-instagram"></i></a>
                        <a href="#"><i class="bi bi-twitter-x"></i></a>
                        <a href="#"><i class="bi bi-linkedin"></i></a>
                    </div>
                </div>
                <div class="col-md-4 col-lg-2 offset-lg-1">
                    <h6 class="mb-4 fw-bold text-uppercase text-white ls-2">The Firm</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="about.html" class="text-secondary small text-decoration-none transition-smooth link-hover">About Protocol</a></li>
                        <li class="mb-2"><a href="services.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Expert Services</a></li>
                        <li class="mb-2"><a href="blog.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Intelligence Feed</a></li>
                    </ul>
                </div>
                <div class="col-md-4 col-lg-2">
                    <h6 class="mb-4 fw-bold text-uppercase text-white ls-2">Client Services</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="contact.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Secure Channel</a></li>
                        <li class="mb-2"><a href="pricing.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Asset Valuation</a></li>
                        <li class="mb-2"><a href="register.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Credential Intake</a></li>
                    </ul>
                </div>
                <div class="col-md-4 col-lg-3">
                    <h6 class="mb-4 fw-bold text-uppercase text-white ls-2">Newsletter</h6>
                    <p class="text-secondary small mb-4">Subscribe for declassified asset reports.</p>
                    <div class="input-group">
                        <input type="email" class="form-control bg-dark border-secondary text-white" placeholder="EMAIL ADDRESS">
                        <button class="btn btn-primary px-3 py-2" type="button"><i class="bi bi-send text-black"></i></button>
                    </div>
                </div>
            </div>
            <hr class="border-secondary opacity-25">
            <div class="row align-items-center py-3">
                <div class="col-md-6 text-center text-md-start">
                    <p class="mb-0 fs-tiny text-secondary">&copy; 2026 Antique Protocol Firm. All assets encrypted and secured.</p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <ul class="list-inline mb-0 fs-tiny text-secondary">
                        <li class="list-inline-item"><a href="#" class="ms-3 text-secondary text-decoration-none link-hover">Privacy_Policy</a></li>
                        <li class="list-inline-item"><a href="#" class="ms-3 text-secondary text-decoration-none link-hover">Terms_of_Engagement</a></li>
                        <li class="list-inline-item"><a href="#" class="ms-3 text-secondary text-decoration-none link-hover">Compliance_Matrix</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
"@

$headScriptHtml = @"
    <script>
        // Apply theme and direction immediately to avoid flash
        (function() {
            let searchParams;
            try { searchParams = new URLSearchParams(window.location.search); } catch(e) {}
            
            const savedTheme = (searchParams && searchParams.get('theme')) || localStorage.getItem('theme') || 'dark';
            const savedDir = (searchParams && searchParams.get('dir')) || localStorage.getItem('dir') || 'ltr';
            
            localStorage.setItem('theme', savedTheme);
            localStorage.setItem('dir', savedDir);
            
            document.documentElement.setAttribute('data-bs-theme', savedTheme);
            document.documentElement.setAttribute('dir', savedDir);

            // Swap Bootstrap CSS if RTL
            if (savedDir === 'rtl') {
                const links = document.querySelectorAll('link[href*="bootstrap.min.css"]');
                links.forEach(link => {
                    link.href = link.href.replace('bootstrap.min.css', 'bootstrap.rtl.min.css');
                });
            }
        })();
    </script>
</head>
"@

$scriptHtml = @"
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
        function updateLinks() {
            const currentTheme = document.documentElement.getAttribute('data-bs-theme');
            const currentDir = document.documentElement.getAttribute('dir');
            document.querySelectorAll('a[href]').forEach(link => {
                let href = link.getAttribute('href');
                if (href && !href.startsWith('http') && !href.startsWith('#') && href.includes('.html')) {
                    try {
                        const url = new URL(link.href);
                        url.searchParams.set('theme', currentTheme);
                        url.searchParams.set('dir', currentDir);
                        link.href = url.href;
                    } catch(e) {}
                }
            });
        }

        function updateUI() {
            const currentTheme = document.documentElement.getAttribute('data-bs-theme');
            const currentDir = document.documentElement.getAttribute('dir');
            
            // Update Theme Icons
            document.querySelectorAll('#themeIcon').forEach(icon => {
                if(currentTheme === 'light') {
                    icon.className = 'bi bi-sun-fill fs-5';
                } else {
                    icon.className = 'bi bi-moon-fill fs-5';
                }
            });

            // Update RTL Labels
            document.querySelectorAll('#rtlLabel').forEach(label => {
                label.textContent = currentDir === 'rtl' ? 'LTR' : 'RTL';
            });
            
            updateLinks();
        }

        function toggleTheme() {
            const currentTheme = document.documentElement.getAttribute('data-bs-theme');
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
            document.documentElement.setAttribute('data-bs-theme', newTheme);
            localStorage.setItem('theme', newTheme);
            updateUI();
        }

        function toggleRTL() {
            const currentDir = document.documentElement.getAttribute('dir');
            const newDir = currentDir === 'rtl' ? 'ltr' : 'rtl';
            document.documentElement.setAttribute('dir', newDir);
            localStorage.setItem('dir', newDir);
            
            // Swap CSS for Real RTL
            const links = document.querySelectorAll('link[href*="bootstrap"]');
            links.forEach(link => {
                if (newDir === 'rtl' && link.href.includes('bootstrap.min.css')) {
                    link.href = link.href.replace('bootstrap.min.css', 'bootstrap.rtl.min.css');
                } else if (newDir === 'ltr' && link.href.includes('bootstrap.rtl.min.css')) {
                    link.href = link.href.replace('bootstrap.rtl.min.css', 'bootstrap.min.css');
                }
            });

            updateUI();
        }

        // Initialize UI on load
        document.addEventListener('DOMContentLoaded', updateUI);
    </script>
</body>
"@

foreach ($file in $files) {
    Write-Host "Syncing $($file.Name)..."
    $content = Get-Content $file.FullName -Raw
    
    # 1. Fix head corruption (remove old script blocks and PowerShell artifacts)
    $content = [regex]::replace($content, "(?s)<script>\s*// Apply theme and direction.*?</script>", "")
    $content = [regex]::replace($content, "(?s)</head>[`"@\s=]+<body>", "</head>`r`n<body>")
    $content = $content.Replace("</head>", $headScriptHtml)

    # 2. Sync Header
    if ($file.Name -ne "login.html" -and $file.Name -ne "register.html") {
        $content = [regex]::replace($content, "(?s)<!-- Header -->.*?<header>.*?</header>", $masterHeader)
        if ($content -notmatch "<!-- Header -->") {
            $content = $content.Replace("<body>", "<body>`r`n$masterHeader")
        }

        # 3. Sync Offcanvas
        $content = [regex]::replace($content, "(?s)<!-- Mobile Menu Offcanvas -->.*?<div class=`"offcanvas.*?</div>\s*</div>", $masterOffcanvas)
        if ($content -notmatch "<!-- Mobile Menu Offcanvas -->") {
            $content = $content.Replace("</header>", "</header>`r`n$masterOffcanvas")
        }

        # 4. Sync Footer
        $content = [regex]::replace($content, "(?s)<!-- Footer -->.*?<footer.*?>.*?</footer>", $masterFooter)
        if ($content -notmatch "<!-- Footer -->") {
            $content = [regex]::replace($content, "(?s)<footer.*?>.*?</footer>", $masterFooter)
        }
    } else {
        # For login and register, strip out navbar/footer/offcanvas if injected
        $content = [regex]::replace($content, "(?s)<!-- Header -->.*?<header>.*?</header>", "")
        $content = [regex]::replace($content, "(?s)<!-- Mobile Menu Offcanvas -->.*?<div class=`"offcanvas.*?</div>\s*</div>", "")
        $content = [regex]::replace($content, "(?s)<!-- Footer -->.*?<footer.*?>.*?</footer>", "")
        # Remove any lingering Header/Offcanvas comments alone if empty
    }

    # 5. Sync Bottom Scripts
    # Cleanup old scripts
    $content = [regex]::replace($content, "(?s)<!-- Scripts -->.*?<script.*?bootstrap.*?></script>", "")
    $content = [regex]::replace($content, "(?s)<script>\s*function updateIcons\(.*?</script>", "")
    $content = [regex]::replace($content, "(?s)<script>\s*function updateUI\(.*?</script>", "")
    $content = [regex]::replace($content, "(?s)<script>\s*function toggleTheme\(.*?</script>", "")
    $content = [regex]::replace($content, "(?s)<script>\s*function toggleRTL\(.*?</script>", "")
    
    $content = $content.Replace("</body>", "")
    $content = $content.Replace("</html>", "")
    
    $content = $content.Trim()
    $content += "`r`n$scriptHtml`r`n</html>"

    Set-Content $file.FullName $content -Encoding UTF8 -NoNewline
}

Write-Host "All HTML files standardized."
