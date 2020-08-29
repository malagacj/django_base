#! /bin/bash

rm db.* places/migrations/0* entities/migrations/0* organization/migrations/0*
python manage.py makemigrations
python manage.py migrate

imports="
from django.contrib.auth import get_user_model;
User = get_user_model();
"

admin=adm
password=adm
shell_comd="
$imports
User.objects.create_superuser(email='admin@admin.com', username='$admin', password='$password');
User.objects.create_user(email='ei.elgatololo@gmail.com', username='lolo', password='elgato');
"

echo $shell_comd | python manage.py shell

#python manage.py import_places initial_data.csv places_summary.txt
#echo "Places Imported"; echo ""

python manage.py import_entities initial_data.csv entities_summary.txt
echo "Entities Imported"; echo ""

#python manage.py import_organization initial_data.csv organization_summary.txt
#echo "Organization Imported"; echo ""

python manage.py runserver
