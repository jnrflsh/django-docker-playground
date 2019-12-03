from django.http import HttpResponse
from django.urls import path


def example_view(request):
    return HttpResponse("My app works!")


urlpatterns = [
    path('', example_view, name="index"),
]
