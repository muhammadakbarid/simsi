<?php if (isset($datakepada)) : ?>

  <?php foreach ($datakepada as $dk) : ?>
    <div>
      <div style="float: right; width: 30%;">
        <table>
          <tr>
            <td><?= date_surat($tanggal); ?></td>
          </tr>
        </table>
      </div>
    </div>

    <table>
      <tr>
        <td>Nomor</td>
        <td>:</td>
        <td><?php if ($print_button == 1) : ?><?= $nomor_surat; ?>
        <?php elseif ($print_button == 2) : ?> <?= $timeline->note; ?>
        <?php endif ?>

        </td>
      </tr>
      <tr>
        <td>Lampiran</td>
        <td>:</td>
        <td><?php if ($lampiran == 0) {
              echo '-';
            } else {
              echo $lampiran;
            } ?>
        </td>
      </tr>
      <tr>
        <td>Perihal</td>
        <td>:</td>
        <td><?= $perihal; ?></td>
      </tr>
    </table>
    <table style=" margin-top: 40px;">
      <tr>
        <td><b>Kepada Yth.</b></td>
      </tr>
      <tr>
        <?php if ($print_button == 1) : ?>
          <td><b><?= $dk['first_name'] . " " . $dk['last_name'] . " (" . $dk['jabatan'] . ")"; ?></b></td>
        <?php elseif ($print_button == 2) : ?>
          <td><b><?= $kepada->first_name . " " . $kepada->last_name . " (" . $kepada->jabatan . ")"; ?></b></td>

        <?php endif ?>

      </tr>
      <tr>
        <td><b>di tempat</b></td>
      </tr>
    </table>
    <table style="margin-top: 40px;">
      <tr>
        <td>
          <?php if ($print_button == 1) : ?><?= $timeline->isi_surat; ?>
        <?php elseif ($print_button == 2) : ?> <?= $timeline->isi; ?>
        <?php endif ?>
        </td>
      </tr>
    </table>


    <div style="margin-top: 40px;">
      <div style="float: right; width: 40%;">
        <table>
          <tr>
            <td>Politeknik Pos Indonesia
            </td>
          </tr>
          <tr>
            <td><?= $timeline->jabatan; ?>
          </tr>
          <br><br><br><br><br><br><br>
          <tr>
            <td>
              <b><?= $timeline->nama_depan . " " . $timeline->nama_belakang; ?></b>
            </td>
          </tr>
          <tr>
            <td>
              <b>Nik. <?= $timeline->nik; ?></b>
            </td>
          </tr>
        </table>
      </div>

      <div style="float: left; width: 40%;">
        <table>
          <tr>
            <td> <u>Tembusan Kepada Yth. :</u>
            </td>
          </tr>
          <tr>
            <td>
              <?php
              $jumlah = count($kepada_tembusan);
              $x = 1;
              foreach ($kepada_tembusan as $k) : ?>
                <table>
                  <tr>
                    <td><?= $x; ?>. </td>
                    <td><?= $k->first_name . ' ' . $k->last_name . ' (' . $k->jabatan . ')'; ?></td>
                  </tr>
                </table>
              <?php
                $x++;
              endforeach; ?>
            </td>
          </tr>
        </table>
      </div>
    </div>

    <pagebreak>

    <?php endforeach ?>
  <?php else : ?>
    <div>
      <div style="float: right; width: 30%;">
        <table>
          <tr>
            <td><?= date_surat($tanggal); ?></td>
          </tr>
        </table>
      </div>
    </div>

    <table>
      <tr>
        <td>Nomor</td>
        <td>:</td>
        <td><?php if ($print_button == 1) : ?><?= $nomor_surat; ?>
        <?php elseif ($print_button == 2) : ?> <?= $timeline->note; ?>
        <?php endif ?>

        </td>
      </tr>
      <tr>
        <td>Lampiran</td>
        <td>:</td>
        <td><?php if ($lampiran == 0) {
              echo '-';
            } else {
              echo $lampiran;
            } ?>
        </td>
      </tr>
      <tr>
        <td>Perihal</td>
        <td>:</td>
        <td><?= $perihal; ?></td>
      </tr>
    </table>
    <table style=" margin-top: 40px;">
      <tr>
        <td><b>Kepada Yth.</b></td>
      </tr>
      <tr>
        <?php if ($print_button == 1) : ?>
          <td><b><?= $KFirstName . " " . $KLastName . " (" . $Kjabatan . ")"; ?></b></td>
        <?php elseif ($print_button == 2) : ?>
          <td><b><?= $kepada->first_name . " " . $kepada->last_name . " (" . $kepada->jabatan . ")"; ?></b></td>

        <?php endif ?>

      </tr>
      <tr>
        <td><b>di tempat</b></td>
      </tr>
    </table>
    <table style="margin-top: 40px;">
      <tr>
        <td>
          <?php if ($print_button == 1) : ?><?= $timeline->isi_surat; ?>
        <?php elseif ($print_button == 2) : ?> <?= $timeline->isi; ?>
        <?php endif ?>
        </td>
      </tr>
    </table>


    <div style="margin-top: 40px;">
      <div style="float: right; width: 40%;">
        <table>
          <tr>
            <td>Politeknik Pos Indonesia
            </td>
          </tr>
          <tr>
            <td><?= $timeline->jabatan; ?>
          </tr>
          <br><br><br><br><br><br><br>
          <tr>
            <td>
              <b><?= $timeline->nama_depan . " " . $timeline->nama_belakang; ?></b>
            </td>
          </tr>
          <tr>
            <td>
              <b>Nik. <?= $timeline->nik; ?></b>
            </td>
          </tr>
        </table>
      </div>

      <div style="float: left; width: 40%;">
        <table>
          <tr>
            <td> <u>Tembusan Kepada Yth. :</u>
            </td>
          </tr>
          <tr>
            <td>
              <?php
              $jumlah = count($kepada_tembusan);
              $x = 1;
              foreach ($kepada_tembusan as $k) : ?>
                <table>
                  <tr>
                    <td><?= $x; ?>. </td>
                    <td><?= $k->first_name . ' ' . $k->last_name . ' (' . $k->jabatan . ')'; ?></td>
                  </tr>
                </table>
              <?php
                $x++;
              endforeach; ?>
            </td>
          </tr>
        </table>
      </div>
    </div>
  <?php endif; ?>