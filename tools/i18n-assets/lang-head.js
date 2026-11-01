(function(){try{
var L=@LANGS@,p=location.pathname;
if(/^\/(@RE@)(\/|$)/.test(p)||/^\/studio(\/|$)/.test(p))return;
var s=null,m=location.search.match(/[?&]lang=([\w-]+)/),want=null,auto=false;
try{s=localStorage.getItem('kshana-lang')}catch(e){}
if(m&&L.indexOf(m[1])>=0){want=m[1]}
else if(s)want=s;
else{auto=true;want=detect()}
if(!want||want==='en'||L.indexOf(want)<0)return;
try{sessionStorage.setItem('kshana-lang-detected',auto?'1':'')}catch(e){}
location.replace('/'+want+p+location.search.replace(/[?&]lang=[\w-]+/,'')+location.hash);
function detect(){var a=navigator.languages&&navigator.languages.length?navigator.languages:[navigator.language||'en'];
for(var i=0;i<a.length;i++){var t=String(a[i]).toLowerCase(),b=t.split('-')[0];
if(b==='en')return'en';
if(b==='pt')return/^pt-(pt|ao|mz|cv|gw|st|tl|mo)$/.test(t)?'pt-PT':'pt-BR';
if(b==='no'||b==='nn'||b==='nb')return'nb';
if(b==='zh'){if(/^zh-(tw|hk|mo|hant)/.test(t))return'en';return'zh-Hans'}
for(var j=0;j<L.length;j++)if(L[j].toLowerCase()===b)return L[j]}
return'en'}
}catch(e){}})();
