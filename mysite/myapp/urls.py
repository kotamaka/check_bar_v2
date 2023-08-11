from django.urls import path
from . import views

urlpatterns = [
    path('',views.index),
    path('insert/',views.insert),
    path('<int:id>/delete/',views.delete_eurusd),
    path('page_eurusd/',views.page_eurusd),
    path('page_gbpusd/',views.page_gbpusd),
    path('page_usdjpy/',views.page_usdjpy),
    path('page_usdchf/',views.page_usdchf),
    path('page_audusd/',views.page_audusd),
    path('page_xauusd/',views.page_xauusd),
]
