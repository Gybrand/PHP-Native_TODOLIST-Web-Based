<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title>Kalender</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- FullCalendar -->
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css" rel="stylesheet">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
    body {
        background-color: #f8f9fa;
        font-family: 'Inter', sans-serif;
        padding: 40px 15px;
    }


    .calendar-container {
        max-width: 2000px;
        margin: auto;
        background-color: #ffffff;
        border-radius: 16px;
        padding: 30px 25px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);

    }

    /* Header kalender */
    .fc .fc-toolbar-title {
        font-size: 20px;
        font-weight: 900;
        color: #343a40;
    }

    .fc-button {
        background-color: #ffffff !important;
        border: 1px solid #ced4da !important;
        color: #495057 !important;
        font-weight: 500;
        padding: 5px 12px !important;
        font-size: 0.875rem;
    }

    .fc-button:hover {
        background-color: #e9ecef !important;
    }

    .fc-button-active {
        background-color: #0d6efd !important;
        color: white !important;
    }

    .fc-col-header-cell-cushion,
    .fc-daygrid-day-number {
        color: #000 !important;
        text-decoration: none !important;
        font-weight: 500;
    }

    .fc-event {
        background-color: #0d6efd;
        border: none;
        border-radius: 4px;
        padding: 2px 6px;
        font-size: 0.7rem;
        font-weight: 100;
    }

    .fc-daygrid-event-dot {
        border-color: #0d6efd;
    }

    /* List view styling */
    .fc-list {
        font-size: 0.95rem;
        color: #000;

    }

    .fc-list-event-title {
        color: #000 !important;
        text-decoration: none !important;
        font-weight: 500;
    }

    .fc-list-event-time {
        display: none;
        /* Hilangkan jam */

    }

    .fc-list-event td {
        background-color: #fff !important;
        border: none !important;
        padding: 10px 8px;


    }

    .fc-list-day {
        background: #f1f3f5 !important;
        color: #000;
        font-weight: 600;
    }

    .fc-list-day-cushion {
        color: #000 !important;
        text-decoration: none !important;
        font-size: 0.85rem;
    }

    .fc-list-empty {
        background-color: #fff;
        color: #6c757d;
        font-size: 0.9rem;
        padding: 20px;
    }


    @media (max-width: 768px) {
        .calendar-container {
            padding: 20px 15px;
        }
    }
    </style>
</head>

<body>

    <div class="calendar-container">
        <div id="calendar"></div>
    </div>

    <!-- FullCalendar JS -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const calendarEl = document.getElementById('calendar');

        const calendar = new FullCalendar.Calendar(calendarEl, {

            initialView: 'dayGridMonth',
            themeSystem: 'bootstrap5',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,listMonth'
            },
            locale: 'id',
            firstDay: 1,
            buttonText: {
                today: 'Hari Ini',
                month: 'Bulan',
                list: 'Daftar'
            },
            events: 'get-events.php',
            eventColor: '#0d6efd',
            nowIndicator: true,
            selectable: false,

            dayMaxEvents: true, // <-- Batasi event di satu hari, kalau lebih akan muncul "+x more"

            dayCellDidMount: function(info) {
                const day = info.date.getDay(); // 0=minggu, 6=sabtu
                if (day === 0 || day === 6) {
                    info.el.style.backgroundColor = '#f8d7da';
                    info.el.style.color = '#842029';
                }
            }
        });



        calendar.render();
    });
    </script>

</body>

</html>