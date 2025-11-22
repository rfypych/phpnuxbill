    <!-- Modal -->
    <div class="modal fade" id="HTMLModal" tabindex="-1" role="dialog" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 1050; align-items: center; justify-content: center;">
        <div class="modal-dialog" style="background: var(--bg-card); border-radius: 0.5rem; max-width: 600px; width: 90%; margin: 50px auto; display: flex; flex-direction: column;">
            <div class="modal-content">
                <div class="modal-header" style="padding: 1rem; border-bottom: 1px solid var(--border-color); display: flex; justify-content: space-between;">
                    <h4 class="modal-title">Info</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="background: none; border: none; font-size: 1.5rem; cursor: pointer;">&times;</button>
                </div>
                <div class="modal-body" id="HTMLModal_konten" style="padding: 1rem; overflow-y: auto;"></div>
                <div class="modal-footer" style="padding: 1rem; border-top: 1px solid var(--border-color); text-align: right;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script src="{$app_url}/ui/themes/neo_wave/scripts/jquery.min.js"></script>
    <script src="{$app_url}/ui/themes/neo_wave/scripts/bootstrap.min.js"></script>
    <script src="{$app_url}/ui/themes/neo_wave/scripts/custom.js?v=neo1.0"></script>

    <script>
        $('.close, .btn[data-dismiss="modal"]').on('click', function() {
            $('#HTMLModal').hide().removeClass('in');
        });
    </script>

    {if isset($xfooter)}
        {$xfooter}
    {/if}
</body>
</html>