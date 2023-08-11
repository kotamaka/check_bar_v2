from django.db import models
import datetime

#now = datetime.datetime.now()
#now.strftime("%d/%m/%Y %H:%M:%S")

# Create your models here.
class Symbol(models.Model):
    id = models.IntegerField(primary_key=True)
    datetime = models.DateTimeField(auto_now=True)
    symbol = models.TextField(max_length=10)
    open = models.FloatField(max_length=10)
    high = models.FloatField(max_length=10)
    low = models.FloatField(max_length=10)
    close = models.FloatField(max_length=10)
    def __str__(self):
        return str(self.id)
