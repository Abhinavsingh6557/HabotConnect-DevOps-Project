import re

from rest_framework import serializers

from .models import Student


class StudentSerializer(serializers.ModelSerializer):

    class Meta:

        model = Student

        fields = "__all__"

    def validate_first_name(self, value):

        if len(value) < 2:
            raise serializers.ValidationError(
                "First name must contain at least 2 characters."
            )

        return value

    def validate_last_name(self, value):

        if len(value) < 2:
            raise serializers.ValidationError(
                "Last name must contain at least 2 characters."
            )

        return value

    def validate_age(self, value):

        if value < 5 or value > 18:
            raise serializers.ValidationError(
                "Age must be between 5 and 18."
            )

        return value

    def validate_weekly_hours(self, value):

        if value < 1 or value > 40:
            raise serializers.ValidationError(
                "Weekly hours must be between 1 and 40."
            )

        return value

    def validate_phone(self, value):

        if not re.fullmatch(r"[6-9]\d{9}", value):

            raise serializers.ValidationError(
                "Invalid phone number."
            )

        return value

    def validate(self, data):

        if data["support_required"] and not data["guardian_consent"]:

            raise serializers.ValidationError(
                {
                    "guardian_consent":
                    "Guardian consent required."
                }
            )

        return data