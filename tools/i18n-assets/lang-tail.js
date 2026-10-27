(function(){try{
document.addEventListener('click',function(e){var a=e.target.closest&&e.target.closest('a[data-lang-switch]');
if(a){try{localStorage.setItem('kshana-lang',a.getAttribute('data-lang-switch'))}catch(x){}}});
var t=document.getElementById('i18n-detected');
if(t){var f=null;try{f=sessionStorage.getItem('kshana-lang-detected');sessionStorage.removeItem('kshana-lang-detected')}catch(x){}
if(f==='1'){var d=document.createElement('div');d.className='i18n-detected';d.setAttribute('role','status');d.innerHTML=t.innerHTML;
var b=document.createElement('button');b.type='button';b.textContent='×';b.setAttribute('aria-label',t.getAttribute('data-dismiss')||'Dismiss');b.onclick=function(){d.remove()};d.appendChild(b);
var mn=document.getElementById('main');if(mn)mn.insertBefore(d,mn.firstChild)}}
}catch(e){}})();
