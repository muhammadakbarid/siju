<!doctype html>
<html>
    <head>
        <title>harviacode.com - codeigniter crud generator</title>
        <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css') ?>"/>
        <style>
            .word-table {
                border:1px solid black !important; 
                border-collapse: collapse !important;
                width: 100%;
            }
            .word-table tr th, .word-table tr td{
                border:1px solid black !important; 
                padding: 5px 10px;
            }
        </style>
    </head>
    <body>
        <h2>View_penjualan List</h2>
        <table class="word-table" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Tanggal Transaksi</th>
		<th>Total Pendapatan</th>
		
            </tr><?php
            foreach ($view_penjualan_data as $view_penjualan)
            {
                ?>
                <tr>
		      <td><?php echo ++$start ?></td>
		      <td><?php echo $view_penjualan->tanggal_transaksi ?></td>
		      <td><?php echo $view_penjualan->total_pendapatan ?></td>	
                </tr>
                <?php
            }
            ?>
        </table>
    </body>
</html>