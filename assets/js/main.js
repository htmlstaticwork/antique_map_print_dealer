/* 
  Antique Map & Print Dealer - Main JavaScript 
*/

document.addEventListener('DOMContentLoaded', () => {
    const htmlElement = document.documentElement;

    // RTL Toggle Logic
    const rtlToggleButton = document.getElementById('rtl-toggle');
    const currentDir = localStorage.getItem('dir') || 'ltr';
    htmlElement.setAttribute('dir', currentDir);

    if (rtlToggleButton) {
        updateRtlLabel(currentDir);
        rtlToggleButton.addEventListener('click', () => {
            const newDir = htmlElement.getAttribute('dir') === 'rtl' ? 'ltr' : 'rtl';
            htmlElement.setAttribute('dir', newDir);
            localStorage.setItem('dir', newDir);
            updateRtlLabel(newDir);
        });
    }

    function updateRtlLabel(dir) {
        const label = rtlToggleButton.querySelector('.rtl-label');
        if (label) label.textContent = dir === 'rtl' ? 'LTR' : 'RTL';
    }

    // Theme Toggle Logic
    const themeToggleButton = document.getElementById('theme-toggle');
    const currentTheme = localStorage.getItem('theme') || 'light';

    // Set initial theme
    htmlElement.setAttribute('data-bs-theme', currentTheme);
    updateThemeIcon(currentTheme);

    themeToggleButton.addEventListener('click', () => {
        const theme = htmlElement.getAttribute('data-bs-theme') === 'dark' ? 'light' : 'dark';
        htmlElement.setAttribute('data-bs-theme', theme);
        localStorage.setItem('theme', theme);
        updateThemeIcon(theme);
    });

    function updateThemeIcon(theme) {
        const icon = themeToggleButton.querySelector('i');
        if (theme === 'dark') {
            icon.classList.replace('bi-moon-fill', 'bi-sun-fill');
        } else {
            icon.classList.replace('bi-sun-fill', 'bi-moon-fill');
        }
    }

    // Scroll Effects
    const navbar = document.querySelector('.navbar');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.classList.add('shadow-lg', 'bg-opacity-95');
        } else {
            navbar.classList.remove('shadow-lg', 'bg-opacity-95');
        }

        // Back to top button visibility
        const btt = document.getElementById('back-to-top');
        if (window.scrollY > 300) {
            btt.style.display = 'block';
        } else {
            btt.style.display = 'none';
        }
    });

    // Back to top click
    const bttLink = document.getElementById('back-to-top');
    if (bttLink) {
        bttLink.addEventListener('click', (e) => {
            e.preventDefault();
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    }

    // Initialize Tooltips & Popovers (Bootstrap)
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
});
