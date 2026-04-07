/* 
  Antique Map & Print Dealer - Main JavaScript 
*/

/**
 * Persistence & Theme/Direction Management
 */
const ThemeManager = {
    init() {
        this.applySavedState();
        document.addEventListener('DOMContentLoaded', () => {
            this.updateUI();
            this.setupToggles();
        });
    },

    getSavedState() {
        return {
            theme: localStorage.getItem('theme') || 'dark',
            dir: localStorage.getItem('dir') || 'ltr'
        };
    },

    applySavedState() {
        const { theme, dir } = this.getSavedState();
        document.documentElement.setAttribute('data-bs-theme', theme);
        document.documentElement.setAttribute('dir', dir);
        this.updateBootstrapCSS(dir);
    },

    updateBootstrapCSS(dir) {
        const links = document.querySelectorAll('link[href*="bootstrap"]');
        links.forEach(link => {
            const href = link.href;
            if (dir === 'rtl') {
                // If it's the standard bootstrap, replace it
                if (href.includes('bootstrap.min.css') && !href.includes('bootstrap.rtl.min.css')) {
                    link.href = href.replace('bootstrap.min.css', 'bootstrap.rtl.min.css');
                }
            } else {
                // If it's the RTL bootstrap, replace it back
                if (href.includes('bootstrap.rtl.min.css')) {
                    link.href = href.replace('bootstrap.rtl.min.css', 'bootstrap.min.css');
                }
            }
        });
    },

    updateUI() {
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

        // Set Active Nav Link
        this.setActiveNavLink();
    },

    setActiveNavLink() {
        const currentPath = window.location.pathname.split('/').pop() || 'index.html';
        const navItems = document.querySelectorAll('.nav-link, .dropdown-item');
        
        navItems.forEach(item => {
            const itemPath = item.getAttribute('href');
            if (!itemPath || itemPath === '#') return;

            // Normalize index.html
            const isHomeCurrent = currentPath === 'index.html' || currentPath === '';
            const isHomeItem = itemPath === 'index.html';

            if (itemPath === currentPath || (isHomeCurrent && isHomeItem)) {
                item.classList.add('active');
                
                // If it's a dropdown item, make the parent toggle active
                if (item.classList.contains('dropdown-item')) {
                    const dropdown = item.closest('.dropdown-menu');
                    if (dropdown) {
                        const toggle = dropdown.previousElementSibling;
                        if (toggle && toggle.classList.contains('dropdown-toggle')) {
                            toggle.classList.add('active');
                        }
                    }
                }
            } else {
                // DON'T remove active from dropdown-toggle if another sub-item might be active
                if (!item.classList.contains('dropdown-toggle')) {
                    item.classList.remove('active');
                }
            }
        });
    },

    setupToggles() {
        window.toggleTheme = () => {
            const currentTheme = document.documentElement.getAttribute('data-bs-theme');
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
            document.documentElement.setAttribute('data-bs-theme', newTheme);
            localStorage.setItem('theme', newTheme);
            this.updateUI();
        };

        window.toggleRTL = () => {
            const currentDir = document.documentElement.getAttribute('dir');
            const newDir = currentDir === 'rtl' ? 'ltr' : 'rtl';
            document.documentElement.setAttribute('dir', newDir);
            localStorage.setItem('dir', newDir);
            this.updateBootstrapCSS(newDir);
            this.updateUI();
        };
    }
};

// Start Theme Manager immediately if possible, or on DOM load
ThemeManager.init();

document.addEventListener('DOMContentLoaded', () => {
    // Scroll Effects
    const navbar = document.querySelector('.navbar');
    if (navbar) {
        window.addEventListener('scroll', () => {
            if (window.scrollY > 50) {
                navbar.classList.add('shadow-lg', 'bg-opacity-95');
            } else {
                navbar.classList.remove('shadow-lg', 'bg-opacity-95');
            }
        });
    }

    // Back to top
    const btt = document.getElementById('back-to-top');
    if (btt) {
        window.addEventListener('scroll', () => {
            if (window.scrollY > 300) {
                btt.style.display = 'block';
            } else {
                btt.style.display = 'none';
            }
        });

        btt.addEventListener('click', (e) => {
            e.preventDefault();
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    }

    // Initialize Tooltips & Popovers (Bootstrap)
    if (window.bootstrap) {
        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    }
});
