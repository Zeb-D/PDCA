/*��JS�ļ�*/
function AjaxProcesser(objID,container){
	this.target="";
	this.defaultStyle=false;
	this.interValID=0;//��ʱ��ID
	this.timeTick=100; //���̲�ѯʱ����
	this.processID="";//����ID
	this.frm=_.$(objID);//��
	this.submit=null;//�ύ��ť\
	this.processIng=null;
	this.processBar=null;//������
	this.process=null;//����
	this.processInfo=null;//������ϸ��Ϣ
	this.uploader=null;//����iframe
	this.split=null;//�������һ���ļ��ı�ʾ
	this.appendTo=_.$(container);//����
	this.files={count:0};//�ļ�����
	this.createUploader();//����AJAX�ϴ�����
	this.startTime=0;//�ϴ���ʼʱ��	
	this.files={count:0,list:{}};
	this.url="";
	this.UpClass="";
	this.store=this.frm.action;
}
AjaxProcesser.prototype.succeed=function(a){
	return;
};
AjaxProcesser.prototype.faild=function(a){
	return;
};
AjaxProcesser.prototype.reset=function(a){
    this.processInfo.innerHTML="";
    this.processDiv.style.display="none";
    this.process.innerHTML="";
    this.process.style.width="0px";
    this.processIng.innerHTML="��ѡ���ļ�...";
	return;
};

AjaxProcesser.prototype.Do=function(){
	this.reset();
	this.processIng.innerHTML="�����ύ...";
	_this=this;
	this.processID="AN" + getID();
	var action=this.store;
	if(action.indexOf("?")>0){
		action=action + "&UpClass=" + this.UpClass + "&processid=" + this.processID;
	}else{
		action=action + "?UpClass=" + this.UpClass + "&processid=" + this.processID;
	}
//	alert("aaa")
	this.frm.action=action;
	this.frm.target=this.target;
	this.frm.submit();
	this.startTime=Date.parse(new Date());
	this.processDiv.style.display="block";
	this.interValID=window.setInterval("_this.getProcess();",this.timeTick);
};

AjaxProcesser.prototype.createUploader=function(){
	var processDiv=document.createElement("div");//�����ڶ���������������Ϣ
	processDiv.style.cssText="display:none;padding:3px;font-size:9pt;border:1px #fff solid;width:100%;margin:5px 2px 2px 0px;";
	
	var processIng=document.createElement("div");//����������ϸ��Ϣ��ʾ
	processIng.style.cssText="padding:2px 5px 2px 1px;font-size:9pt;margin:0px;";
	processIng.innerHTML="����";
	this.processIng=processIng;
	processDiv.appendChild(processIng);//�ѽ�����ϸ��Ϣ��ʾ��ӵ�����
	
	var processBar=document.createElement("div");//����һ��������
	processBar.style.cssText="font-size:9pt;width:400px;padding:1px;margin:0px;height:auto;border:1px #3D698E solid;background-color:#ffffff;";
	var process=document.createElement("div");//��������
	process.style.cssText="padding:5px;font-size:9pt;text-align:center;background-color:#0099ff;width:0px;height:13px;padding:1px 0px 0px 2px;FILTER: progid:DXImageTransform.Microsoft.Gradient(startColorStr='#499DC9', endColorStr='#8CD6F3', gradientType='1'"
	//process.innerHTML="0.00%";
	this.process=process;
	processBar.appendChild(process);//�ѽ�����ӵ�������
	this.processBar=processBar;
	processDiv.appendChild(processBar);//�ѽ�������ӵ�����
	
	var processInfo=document.createElement("div");//����������ϸ��Ϣ��ʾ
	processInfo.style.cssText="padding:2px 5px 2px 1px;font-size:9pt;"
	this.processInfo=processInfo;
	processDiv.appendChild(processInfo);//�ѽ�����ϸ��Ϣ��ʾ��ӵ�����
	this.processDiv=this.appendTo.appendChild(processDiv);
};

/*��ȡ�ϴ�����*/
AjaxProcesser.prototype.getProcess=function(){
	_this=this;
    _.Ajax({
        asc:true,
        url:"getProcess.asp?processid=" + this.processID,
        dataType:"json",
        succeed:function(msg){
		if(msg==null){return;}
            var pro=_this.getInformation(msg);            //���ﷵ�����е��ϴ���Ϣ,����ʾ��д��Ϣ�������ɾ���
            var str="";
            var img="�ߡ�";
            if(pro.finish){img="<span style=\"font-weight:bold;color:green;\">�� ";}
            if(pro.step=="faild"){img="<span style=\"font-weight:bold;color:red;\">��";}
            _this.processIng.innerHTML= str + img + pro.alt + "</span>";
            str= str + "�ܴ�С:" + reSize(pro.total);
            str= str + "&nbsp; <span style=\"color:green;\">���ϴ�:" + reSize(pro.cur) + "</span>";
			str= str + "&nbsp; <span style=\"color:red;\">�ϴ��ٶ�:" + pro.speed + "</span>";
            _this.processInfo.innerHTML= str;
            _this.process.innerHTML=pro.percent;
            _this.process.style.width=parseInt(Math.floor(398 * pro.process)) + "px"; //��ʾ����
            if(pro.finish){
				_this.frm.reset();
				window.clearInterval(_this.interValID);
				if(pro.step=="faild"){
					_this.faild(pro.msg);
				}
				if(pro.step=="saved"){
					_this.succeed(pro.msg);
				}
            }
        }
    });
};

/*��ȡ�ϴ���Ϣ*/
AjaxProcesser.prototype.getInformation=function(info){
    //��Ϣ����,�벻Ҫ�޸�
    var uploadInfo={
        ID:info.ID,         //�ϴ��Ľ���ID
        stepId:0,
        step:info.step,     //�ϴ����̵�Ӣ����ʾ
        DT:info.dt,         //�ϴ�����ʱ��
        total:info.total,   //�ϴ��������ݴ�С(�ֽ�)
        cur:info.now,       //�Ѿ��ϴ������ݴ�С
		speed:reSize(parseInt(info.now/((Date.parse(new Date())-this.startTime)/1000))) + "/��",
        process:(Math.floor((info.now / info.total) * 100) / 100),  //�ϴ����ȵ�С����ʽ,���ڽ�����
        percent:(Math.floor((info.now / info.total) * 10000) / 100) + "%", //���̽��ȵİٷֱ���ʽ
        alt:"",             //�ϴ����̵�������ʾ
        msg:"",             //������ʾ������Ϣ,�������ԭ���
        finish:false        //�Ƿ��Ѿ����
    };
    /*״̬˵��*/
    switch(info.step){
        case "":
            uploadInfo.alt="���ڳ�ʼ���ϴ�...";
            uploadInfo.stepId=1;
            break;
        case "uploading":
            uploadInfo.alt="�����ϴ�...";
            uploadInfo.stepId=2;
            break;
        case "uploaded":
            uploadInfo.alt="�ϴ����,����������������...";
            uploadInfo.stepId=3;
            break;
        case "processing":
            uploadInfo.alt="���ڴ����ļ�: ";
            uploadInfo.stepId=4;
            break;
        case "processed":
            uploadInfo.alt="�����������,׼�������ļ�...";
            uploadInfo.stepId=5;
            break;
        case "saving":
            uploadInfo.alt="���ڱ����ļ�: " + info.description;
            uploadInfo.stepId=6;
            break;
        case "saved":
            uploadInfo.alt="�ļ��������,�ϴ��ɹ�!";
			uploadInfo.msg=eval("[" + info.description.substr(0,info.description.length-1) + "]")
			uploadInfo.stepId=7;
            uploadInfo.finish=true;
            break;
        case "faild":
            uploadInfo.alt="�ϴ�ʧ��!" + info.description;
				tijiaoKJ.style.display=''
            uploadInfo.msg=info.description;
            uploadInfo.stepId=8;
            uploadInfo.finish=true;       
            break;
        case "over":
            uploadInfo.alt="�ύ���!" + info.description;
				tijiaoKJ.style.display=''
				uploadContenter.style.display='none'
				isokup.style.display=''

            uploadInfo.msg=info.description;
            uploadInfo.stepId=10;
            uploadInfo.finish=true;       
            break;
        default:
            uploadInfo.alt="�޴˲���!";
            uploadInfo.stepId=9;
            uploadInfo.finish=true;
    }
    return uploadInfo;
}


/*��ʽ������*/
var reSize =function (num){
    var Size=parseInt(num);
    var res="";
    if(Size < 1024){
       res= Math.floor(Size * 100) /100 + "B"
    }else if(Size >= 1024 && Size < 1048576){
       res= Math.floor((Size / 1024) * 100) /100  + "KB"
    }else if(Size >= 1048576){
       res= Math.floor(((Size / 1024) / 1024) *  100) /100 + "MB"
    }
    return res;
};


/*�����ϴ�ID*/
var getID=function (){
    var mydt=new Date();
    with(mydt){
        var y=getYear();if(y<10){y='0'+y}
        var m=getMonth()+1;if(m<10){m='0'+m}
        var d=getDate();if(d<10){d='0'+d}
        var h=getHours();if(h<10){h='0'+h}
        var mm=getMinutes();if(mm<10){mm='0'+mm}
        var s=getSeconds();if(s<10){s='0'+s}
    }
    var r="000" + Math.floor(Math.random() * 1000);
    r=r.substr(r.length-4);
    return y + m + d + h + mm + s + r;
};