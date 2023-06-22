from django.urls import path

from . import views

app_name = <placeholder>
urlpatterns = [
    path(
        "",
        views.Index.as_view(template_name="common/index.html"),
        name="index",
    ),
]
