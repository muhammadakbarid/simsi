<style>
  .pdfobject-container {
    background-color: blue;
  }
</style>
<div id="example1"></div>
<script src="<?= base_url('assets/js/pdfobject.min.js'); ?>"></script>
<script>
  PDFObject.embed("<?= base_url('upload/surat-internal/') . $nama_file; ?>", "#example1");
</script>