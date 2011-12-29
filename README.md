## Potrzebne uprawnienia dla folderów:

    sudo chown apache:apache tmp/smarty/templates_c
    sudo chown apache:apache tmp/smarty/cache
    chmod 775 tmp/smarty/templates_c
    chmod 775 tmp/smarty/cache

## Symlink do folderu `public` dla Apache:

    ln -s /home/uzytkownik/projekty/Exercises/public/ /var/www/exercises

## Gdy routing nie działa po wykonaniu powyższych instrukcji, to zainstalowac:

    sudo a2enmod rewrite
