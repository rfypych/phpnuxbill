            </section> <!-- End Content -->
        </div> <!-- End Content Wrapper -->

        <footer class="main-footer" style="background: var(--bg-card); padding: 1rem; text-align: center; border-top: 1px solid var(--border-color);">
            {if isset($_c['CompanyFooter'])}
                {$_c['CompanyFooter']}
            {else}
                <strong>&copy; {date('Y')} <a href="#">{$_c['CompanyName']}</a>.</strong> All rights reserved.
            {/if}
            <div class="pull-right hidden-xs">
                <a href="javascript:showPrivacy()">Privacy</a> &bull; <a href="javascript:showTaC()">T&C</a>
            </div>
        </footer>

    </div> <!-- End Wrapper -->

    <!-- Modal -->
    <div class="modal fade" id="HTMLModal" tabindex="-1" role="dialog" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 1050; align-items: center; justify-content: center;">
        <div class="modal-dialog" style="background: var(--bg-card); border-radius: 0.5rem; max-width: 600px; width: 90%; margin: 50px auto; display: flex; flex-direction: column;">
            <div class="modal-content" style="display: flex; flex-direction: column; max-height: 90vh;">
                <div class="modal-header" style="padding: 1rem; border-bottom: 1px solid var(--border-color); display: flex; justify-content: space-between; align-items: center;">
                    <h4 class="modal-title">Info</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="background: none; border: none; font-size: 1.5rem; cursor: pointer; color: var(--text-muted);">&times;</button>
                </div>
                <div class="modal-body" id="HTMLModal_konten" style="padding: 1rem; overflow-y: auto;"></div>
                <div class="modal-footer" style="padding: 1rem; border-top: 1px solid var(--border-color); text-align: right;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="{$app_url}/ui/themes/neo_wave/scripts/jquery.min.js"></script>
    <!-- Removed Bootstrap JS dependency if possible, but custom.js might need it.
         The original theme uses adminlte.min.js and bootstrap.min.js.
         I should probably include them for compatibility with plugins unless I rewrite everything.
         To be safe, I will include them but rely on my CSS for styling. -->
    <script src="{$app_url}/ui/themes/neo_wave/scripts/bootstrap.min.js"></script>
    <!-- I will comment out adminlte.min.js as it interferes with my custom sidebar logic, unless necessary -->
    <!-- <script src="{$app_url}/ui/themes/neo_wave/scripts/adminlte.min.js"></script> -->

    <script src="{$app_url}/ui/themes/neo_wave/scripts/plugins/select2.min.js"></script>
    <script src="{$app_url}/ui/themes/neo_wave/scripts/custom.js?v=neo1.0"></script>

    <!-- Neo Wave Scripts -->
    <script>
        // Sidebar Toggle
        $(document).ready(function() {
            $('#sidebarToggle').on('click', function(e) {
                e.preventDefault();
                $('body').toggleClass('sidebar-open');
                // For desktop
                if ($(window).width() > 768) {
                    $('.main-sidebar').css('transform', $('body').hasClass('sidebar-collapsed') ? 'translateX(-100%)' : 'translateX(0)');
                    $('.content-wrapper').css('margin-left', $('body').hasClass('sidebar-collapsed') ? '0' : '250px');
                    $('body').toggleClass('sidebar-collapsed');
                } else {
                    $('.main-sidebar').css('transform', $('body').hasClass('sidebar-open') ? 'translateX(0)' : 'translateX(-100%)');
                }
            });

            // Dropdown Toggle (Custom implementation if Bootstrap's fails without full BS JS)
            $('.dropdown-toggle').on('click', function(e) {
                e.preventDefault();
                $(this).next('.dropdown-menu').toggle();
            });

            // Close dropdowns when clicking outside
            $(document).on('click', function(e) {
                if (!$(e.target).closest('.dropdown').length) {
                    $('.dropdown-menu').hide();
                }
            });

            // Modal Close logic
            $('.close, .btn[data-dismiss="modal"]').on('click', function() {
                $('#HTMLModal').hide().removeClass('in');
            });

            // Override custom.js modal show if needed, or ensure #HTMLModal works
            // custom.js likely uses $('#HTMLModal').modal('show'); which requires bootstrap.js.
            // Since I included bootstrap.min.js, it should work.
        });

        // Dark Mode Logic
        const toggleIcon = document.getElementById('toggleIcon');
        const body = document.body;

        function updateIcon(isDark) {
            if (isDark) {
                toggleIcon.innerHTML = '<i class="fa fa-sun-o"></i>';
            } else {
                toggleIcon.innerHTML = '<i class="fa fa-moon-o"></i>';
            }
        }

        // Initial Icon State
        updateIcon(body.classList.contains('dark-mode'));

        toggleIcon.addEventListener('click', (e) => {
            e.preventDefault();
            body.classList.toggle('dark-mode');
            const isDark = body.classList.contains('dark-mode');
            localStorage.setItem('mode', isDark ? 'dark' : 'light');
            updateIcon(isDark);
        });

        // Language Cookie
        function setCookie(name, value, days) {
            var expires = "";
            if (days) {
                var date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + (value || "") + expires + "; path=/";
        }
        setCookie('user_language', '{$user_language}', 365);

        // Ask Confirmation
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
        <!-- Tawk.to -->
        <script type="text/javascript">
            var Tawk_API = {
                onLoad: function() {
                    Tawk_API.setAttributes({
                        'username'    : '{$_user['username']}',
                        'service'    : '{$_user['service_type']}',
                        'balance'    : '{$_user['balance']}',
                        'account'    : '{$_user['account_type']}',
                        'phone'    : '{$_user['phonenumber']}'
                    }, function(error) {});
                }
            };
            Tawk_API.visitor = {
                name: '{$_user['fullname']}',
                email: '{$_user['email']}',
                phone: '{$_user['phonenumber']}'
            };
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