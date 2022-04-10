<footer>
    <div class="footer clearfix mb-0 text-muted">
        <div class="float-start">
            <p>2021 &copy; Mazer</p>
        </div>
        <div class="float-end">
            <p>Crafted with <span class="text-danger"><i class="bi bi-heart"></i></span> by <a href="http://ahmadsaugi.com">A. Saugi</a></p>
        </div>
    </div>
</footer>
</div>
</div>
<script src="<?= base_url('assets/'); ?>vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="<?= base_url('assets/'); ?>js/bootstrap.bundle.min.js"></script>

<script src="<?= base_url('assets/'); ?>vendors/apexcharts/apexcharts.js"></script>
<script src="<?= base_url('assets/'); ?>js/pages/dashboard.js"></script>
<script src="assets/vendors/chartjs/Chart.min.js"></script>
<script src="assets/js/pages/ui-chartjs.js"></script>

<script src="<?= base_url('assets/'); ?>js/mazer.js"></script>

<script src="<?= base_url('assets/'); ?>vendors/jquery/jquery.min.js"></script>
<script src="<?= base_url('assets/'); ?>vendors/jquery-datatables/jquery.dataTables.min.js"></script>
<script src="<?= base_url('assets/'); ?>vendors/jquery-datatables/custom.jquery.dataTables.bootstrap5.min.js"></script>
<script src="<?= base_url('assets/'); ?>vendors/fontawesome/all.min.js"></script>
<script>
    // Jquery Datatable
    let jquery_datatable = $("#table1").DataTable()
</script>

<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
</script>
<script>
    // var i = 0;

    function tambahform() {
        $("#solusi").append('<div class="col-12"><div class="form-group"><h5>Solusi</h5><textarea class="form-control form-control-lg" name="solusi[]" placeholder="Solusi" id=""></textarea><?= form_error('solusi', '<large class="text-danger pl-3">', '</large>'); ?></div></div>');
        // console.log(i);
        // i++;
    }
</script>
</body>

</html>