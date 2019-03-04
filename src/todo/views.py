from django.shortcuts import render
from todo.models import TodoItem
from todo.serializers import TodoItemSerializers
from rest_framework import status
from rest_framework import viewsets
from rest_framework.reverse import reverse
from rest_framework.decorators import list_route
from rest_framework.response import Response

# Create your views here.

class TodoItemViewSet(viewsets.ModelViewSet):
    queryset = TodoItem.objects.all()
    serializer_class = TodoItemSerializers

    def perform_create(self, serializer):
        instance = serializer.save()
        instance.url = reverse('todoitem-detail', args=[instance.pk], request=self.request)
        instance.save()

    def delete(self, request):
        TodoItem.objects.all().delete()
        return Response(status=HTTP_204_NO_CONTENT)

