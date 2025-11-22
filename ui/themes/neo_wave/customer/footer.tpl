            </section>
        </div> <!-- /.content-wrapper -->
    </div> <!-- /.wrapper -->

    <!-- Custom Footer -->
    <footer style="text-align: center; padding: 2rem; color: var(--text-muted); font-size: 0.875rem;">
        {if isset($_c['CompanyFooter'])}
            {$_c['CompanyFooter']}
        {else}
            PHPNuxBill by <a href="https://github.com/hotspotbilling/phpnuxbill" target="_blank">iBNuX</a>
        {/if}
        <div style="margin-top: 0.5rem;">
            <a href="javascript:void(0)" onclick="showPrivacy()">Privacy</a> &bull;
            <a href="javascript:void(0)" onclick="showTaC()">T &amp; C</a>
        </div>
    </footer>

    <!-- Modal Structure (Vanilla JS) -->
    <div id="customModalOverlay" class="custom-modal-overlay">
        <div class="custom-modal">
            <button class="close-modal" onclick="closeModal()">&times;</button>
            <h3 id="customModalTitle"></h3>
            <div id="customModalContent" style="margin-top: 1rem;"></div>
        </div>
    </div>

    <!-- Scripts -->
    <!-- jQuery is required for existing AJAX logic in custom.js and api-get-text -->
    <script src="{$app_url}/ui/ui/scripts/jquery.min.js"></script>
    <!-- Select2 might be needed for forms, keeping it but might need styling adjustments -->
    <script src="{$app_url}/ui/ui/scripts/plugins/select2.min.js"></script>
    <!-- Core Logic -->
    <script src="{$app_url}/ui/ui/scripts/custom.js?v=2"></script>

    <script>
        // Feather Icons
        feather.replace();

        // Sidebar Toggle
        document.getElementById('sidebarToggle').addEventListener('click', function() {
            document.body.classList.toggle('sidebar-open');
            const sidebar = document.querySelector('.main-sidebar');
            if (sidebar.style.transform === 'translateX(0px)') {
                sidebar.style.transform = '';
            } else {
                sidebar.style.transform = 'translateX(0px)';
            }
        });

        // Dark Mode Logic
        const toggleBtn = document.getElementById('darkModeToggle');
        const icon = document.getElementById('darkModeIcon');
        const body = document.body;

        function updateIcon() {
            if (body.classList.contains('dark-mode')) {
                icon.setAttribute('data-feather', 'sun');
            } else {
                icon.setAttribute('data-feather', 'moon');
            }
            feather.replace();
        }

        // Set initial icon
        updateIcon();

        toggleBtn.addEventListener('click', (e) => {
            e.preventDefault();
            body.classList.toggle('dark-mode');
            const isDark = body.classList.contains('dark-mode');
            localStorage.setItem('mode', isDark ? 'dark' : 'light');
            updateIcon();
        });

        // Custom Modal Logic (Replacing Bootstrap Modal)
        const modalOverlay = document.getElementById('customModalOverlay');
        const modalTitle = document.getElementById('customModalTitle');
        const modalContent = document.getElementById('customModalContent');

        window.openModal = function(title, content) {
            modalTitle.innerText = title;
            modalContent.innerHTML = content;
            modalOverlay.classList.add('active');
        }

        window.closeModal = function() {
            modalOverlay.classList.remove('active');
        }

        // Override existing showPrivacy/showTaC to use new modal
        window.showPrivacy = function() {
            openModal('Privacy Policy', '<center>Loading...</center>');
            $.get('pages/Privacy_Policy.html?' + (new Date()), function (data) {
                modalContent.innerHTML = data;
            });
        }

        window.showTaC = function() {
            openModal('Terms and Conditions', '<center>Loading...</center>');
            $.get('pages/Terms_and_Conditions.html?' + (new Date()), function (data) {
                modalContent.innerHTML = data;
            });
        }

        // API Get Text Logic (from original footer)
        var listAtts = document.querySelectorAll(`[api-get-text]`);
        listAtts.forEach(function(el) {
            $.get(el.getAttribute('api-get-text'), function(data) {
                el.innerHTML = data;
            });
        });

        // Button Loading State
        $(document).ready(function() {
            $('button[type="submit"]').on('click', function() {
                var $this = $(this);
                var originalText = $this.html();
                $this.html('<span class="spinner-border spinner-border-sm"></span> Loading...');
                setTimeout(() => {
                    $this.prop("disabled", true);
                }, 100);
            });
        });

        function ask(field, text){
            if (confirm(text)) {
                return true;
            } else {
                return false;
            }
        }
    </script>

    {if isset($xfooter)}
        {$xfooter}
    {/if}

    {if $_c['tawkto'] != ''}
        <!--Start of Tawk.to Script-->
        <script type="text/javascript">
            var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
            (function() {
                var s1 = document.createElement("script"),
                    s0 = document.getElementsByTagName("script")[0];
                s1.async = true;
                s1.src = 'https://embed.tawk.to/{$_c['tawkto']}';
                s1.charset = 'UTF-8';
                s1.setAttribute('crossorigin', '*');
                s0.parentNode.insertBefore(s1, s0);
            })();
        </script>
    {/if}
</body>
</html>