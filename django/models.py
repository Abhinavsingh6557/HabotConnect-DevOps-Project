from django.db import models


class Student(models.Model):

    student_id = models.UUIDField(primary_key=True)

    first_name = models.CharField(max_length=50)

    last_name = models.CharField(max_length=50)

    email = models.EmailField(unique=True)

    phone = models.CharField(max_length=10)

    age = models.PositiveIntegerField()

    guardian_name = models.CharField(max_length=100)

    guardian_consent = models.BooleanField(default=False)

    support_required = models.BooleanField(default=False)

    weekly_hours = models.PositiveIntegerField()

    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = "student"

    def __str__(self):
        return f"{self.first_name} {self.last_name}"