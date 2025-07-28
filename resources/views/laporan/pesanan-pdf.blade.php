<!DOCTYPE html>
<html>

<head>
    <title>Laporan Pesanan</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .summary {
            margin-bottom: 30px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th,
        .table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .table th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>
    <div class="header">
        <h2>Laporan Pesanan</h2>
        <p>Periode: {{ $start_date }} s/d {{ $end_date }}</p>
        <p>Generated: {{ $generated_at }}</p>
    </div>

    <div class="summary">
        <h3>Ringkasan</h3>
        <p>Total Pesanan: {{ $total_pesanan }}</p>
        <p>Total Pendapatan: Rp {{ number_format($total_pendapatan, 0, ',', '.') }}</p>
    </div>

    <table class="table">
        <thead>
            <tr>
                <th>ID Pesanan</th>
                <th>Tanggal</th>
                <th>Customer</th>
                <th>Status</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            @foreach($pesanan_list as $pesanan)
            <tr>
                <td>#{{ $pesanan->id }}</td>
                <td>{{ $pesanan->tanggal_pesan }}</td>
                <td>{{ $pesanan->user->name ?? 'N/A' }}</td>
                <td>{{ $pesanan->status }}</td>
                <td>Rp {{ number_format($pesanan->detail->sum('subtotal'), 0, ',', '.') }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>

</html>