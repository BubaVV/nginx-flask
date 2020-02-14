from django.http import HttpResponse

def helloworld(request):
    return HttpResponse("Hello from Django!\n")