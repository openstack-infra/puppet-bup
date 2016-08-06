# Define: bup::site
#
define bup::site(
  $backup_user,
  $backup_server,
  $cron_minute   = '37',
  $cron_hour     = '5',
  $cron_weekday  = '*',
  $cron_monthday = '*',
  $cron_month    = '*',
) {
  cron { "bup-${name}":
    user     => 'root',
    minute   => $cron_minute,
    hour     => $cron_hour,
    weekday  => $cron_weekday,
    monthday => $cron_monthday,
    month    => $cron_month,
    command  => "tar -X /etc/bup-excludes -cPf - / | bup split -r ${backup_user}@${backup_server}: -n root -q",
    require  => Package['bup'],
  }
}
