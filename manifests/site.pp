# Define: bup::site
#
define bup::site(
  $backup_user,
  $backup_server,
  $cron_minute  = '37',
  $cron_hour    = '5',
  $cron_date    = '*',
  $cron_month   = '*',
  $cron_weekday = '*',
) {
  cron { "bup-${name}":
    user    => 'root',
    minute  => $cron_minute,
    hour    => $cron_hour,
    date    => $cron_date,
    month   => $cron_month,
    weekday => $cron_weekday,
    command => "tar -X /etc/bup-excludes -cPf - / | bup split -r ${backup_user}@${backup_server}: -n root -q",
  }
}
