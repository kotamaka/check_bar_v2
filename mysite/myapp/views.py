from django.shortcuts import render,redirect,get_object_or_404
from .models import Symbol
import datetime

# Create your views here.
def index(request):
    data = {
        'data': Symbol.objects.all(),
    }
    return render(request,'index.html',data)

def insert(request):
    if request.method == 'GET':
        symbol = request.GET['symbol']
        open_value = request.GET['open']
        high_value = request.GET['high']
        low_value = request.GET['low']
        close_value = request.GET['close']

        is_duplicate = Symbol.objects.filter(open=open_value,
                                             high=high_value,
                                             low=low_value,
                                             close=close_value).exists()

        if is_duplicate:
            print('Data duplicate!')
        else:
            entry = Symbol(symbol=symbol, open=open_value, high=high_value, low=low_value, close=close_value)
            entry.save()
            print('Add data successful!')
        
        return redirect('/')
    
    return render(request,'insert.html')

def delete_eurusd(request,id):
    context = {}
    obj = get_object_or_404(Symbol,id=id)
    
    if request.method == 'POST':
        obj.delete()

        return redirect('/')

    return render(request,'index.html')

def page_eurusd(request):
    data = {
        'data':Symbol.objects.all(),
        'latest':Symbol.objects.latest('id')
        }
    #obj = {'latest':Symbol.objects.latest('id')}
    return render(request,'page_eurusd.html',data)

def page_gbpusd(request):
    data = {
        'data':Symbol.objects.all()
    }
    return render(request,'page_gbpusd.html',data)

def page_eurusd(request):
    data = {
        'data':Symbol.objects.all()
    }
    return render(request,'page_eurusd.html',data)

def page_usdjpy(request):
    data = {
        'data':Symbol.objects.all()
    }
    return render(request,'page_usdjpy.html',data)

def page_usdchf(request):
    data = {
        'data':Symbol.objects.all()
    }
    return render(request,'page_usdchf.html',data)

def page_audusd(request):
    data = {
        'data':Symbol.objects.all()
    }
    return render(request,'page_audusd.html',data)

def page_xauusd(request):
    data = {
        'data':Symbol.objects.all()
    }
    return render(request,'page_xauusd.html',data)