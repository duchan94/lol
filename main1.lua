require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.content.*"
import "android.provider.*"
import "android.net.*"
import "android.graphics.*"
--import "java.io.File"
import "AndLua"
--import "layout"

layout=
{
  LinearLayout;
  layout_width="fill";
  layout_height="fill";
  background="res/images/bg.png";
  {
    LinearLayout;
    gravity="center";
    layout_height="fill";
    layout_width="fill";
    orientation="vertical";
    {
      CircleImageView;
      src="icon.png";
      layout_width="15%h";
      layout_height="15%h";
    };
    {
      LinearLayout;
      layout_width="fill";
      layout_height="3%h";
    };
    {
      TextView;
      text="Hi, please insert your key to sign in";
      layout_height="wrap";
      textColor="0xFFFFCE00";
      layout_width="wrap";
      id="greeting";
    };
    {
      LinearLayout;
      layout_width="fill";
      layout_height="3%h";
    };
    {
      LinearLayout;
      layout_width="wrap";
      layout_height="wrap";
      {
        CardView;
        backgroundColor="0xFFFF5F2E";
        layout_width="40.5%h";
        layout_height="6.5%h";
        {
          LinearLayout;
          gravity="center";
          layout_width="fill";
          layout_height="fill";
          {
            LinearLayout;
            gravity="center_vertical";
            orientation="horizontal";
            backgroundColor="0xFFFFFFFF";
            layout_width="40%h";
            layout_height="6%h";
            {
              LinearLayout;
              layout_width="0.5%h";
              layout_height="fill";
            };
            {
              ImageView;
              colorFilter="0xFFFF5F2E";
              layout_height="4%h";
              padding="5dp";
              layout_width="4%h";
              src="res/images/ic_key.png";
            };
            {
              LinearLayout;
              layout_width="0.5%h";
              layout_height="fill";
            };
            {
              EditText;
              hint="Enter your key here...";
              backgroundColor="none";
              hintTextColor="0x3E000000";
              layout_width="30%h";
              id="txtPass";
              layout_height="wrap";
              textColor="0xFF000000";
              textSize="14sp";
              inputType="textPassword";
            };
            {
              LinearLayout;
              layout_width="0.5%h";
              layout_height="fill";
            };
            {
              CardView;
              cardElevation="0dp";
              backgroundColor="0x00000000";
              radius="50";
              layout_width="wrap";
              layout_height="wrap";
              {
                ImageView;
                colorFilter="0xFFC0C0C0";
                layout_height="4%h";
                src="res/images/ic_visibility.png";
                padding="5dp";
                layout_width="4%h";
                id="disKey";
              };
              {
                ImageView;
                colorFilter="0xFFC0C0C0";
                visibility="gone";
                layout_height="4%h";
                src="res/images/ic_visibility_off.png";
                padding="5dp";
                layout_width="4%h";
                id="enKey";
              };
            };
            {
              LinearLayout;
              layout_width="0.5%h";
              layout_height="fill";
            };
          };
        };
      };
    };
    {
      LinearLayout;
      layout_width="fill";
      layout_height="0.5%h";
    };
    {
      LinearLayout;
      visibility="gone";
      layout_width="fill";
      layout_height="wrap";
      {
        CheckBox;
        text="Remember Key?";
        layout_height="wrap";
        layout_marginLeft="5%h";
        textColor="0xFF000000";
        layout_width="wrap";
        id="rememberKey";
      };
    };
    {
      LinearLayout;
      layout_width="fill";
      layout_height="0.5%h";
    };
    {
      CardView;
      radius="50";
      layout_width="wrap";
      layout_height="wrap";
      {
        Button;
        text="Login";
        layout_height="wrap";
        backgroundColor="0xFFFF5F2E";
        textColor="0xFFFFFFFF";
        layout_width="40.5%h";
        id="btnSignIn";
      };
    };
    {
      LinearLayout;
      layout_width="fill";
      layout_height="1%h";
    };
    {
      CardView;
      radius="50";
      layout_width="wrap";
      layout_height="wrap";
      {
        Button;
        text="Coppy UUID Get Key";
        layout_height="wrap";
        backgroundColor="0xFFFF5F2E";
        textColor="0xFFFFFFFF";
        layout_width="40.5%h";
        id="btnGetKey";
      };
    };
    {
      LinearLayout;
      layout_width="fill";
      layout_height="1%h";
    };
    {
      TextView;
      text="Need help? Contact me on";
      textColor="0x7BFFFF00";
      layout_height="wrap";
      layout_width="wrap";
      textSize="11sp";
    };
      {
      LinearLayout;
      layout_width="fill";
      layout_height="1%h";
    };
    {
      LinearLayout;
      layout_height="wrap";
      layout_width="wrap";
      orientation="horizontal";
      {
        ImageView;
        src="res/images/ic_ig.png";
        id="ic_ig";
        layout_width="4%h";
        layout_height="4%h";
      };
      {
        LinearLayout;
        layout_width="1%h";
        layout_height="fill";
      };
      {
        ImageView;
        src="res/images/ic_tg.png";
        id="ic_tg";
        layout_width="4%h";
        layout_height="4%h";
      };
    };
  };
};




activity.setTheme(android.R.style.Theme_DeviceDefault_Light)
--activity.setTheme(R.AndLua14)
activity.setContentView(loadlayout(layout))
activity.ActionBar.hide()
activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)

greeting.setTypeface(Typeface.createFromFile(activity.getLuaDir("res/fonts/getpid.ttf")))

RippleHelper(disKey).RippleColor=0x09000000
RippleHelper(enKey).RippleColor=0x09000000
RippleHelper(btnSignIn).RippleColor=0x09000000
RippleHelper(btnGetKey).RippleColor=0x09000000

import "android.text.method.*"
function disKey.onClick()
  txtPass.setTransformationMethod(HideReturnsTransformationMethod.getInstance());
  disKey.setVisibility(View.GONE)
  enKey.setVisibility(View.VISIBLE)
end

function enKey.onClick()
  txtPass.setTransformationMethod(PasswordTransformationMethod.getInstance());
  enKey.setVisibility(View.GONE)
  disKey.setVisibility(View.VISIBLE)
end

function btnSignIn.onClick()
  local key = txtPass.text
  import "android.provider.Settings$Secure"
  uuid = Secure.getString(activity.getContentResolver(), Secure.ANDROID_ID)
  if !key || key == "" then
    print("Password can't be empty!")
   else
    local pref = activity.getSharedPreferences("plexuslogin", Context.MODE_PRIVATE)
    local save = pref.edit()
    save.putString("login", key)
    save.commit()
    local dl=ProgressDialog.show(activity,nil,'Please wait!')
    dl.show()
    Http.post("https://ndhdate.000webhostapp.com/logindate/login.php","password="..key.."&uuid="..uuid,nil,"utf8",nil,function(code,body,cookie,header)
      local a=0
      local tt=Ticker()
      tt.start()
      tt.onTick=function()
        a=a+1
        if a==5 then
          dl.dismiss()
          tt.stop()
          if code == 200 then
            if body:match("Success") then
              print("Login Success!")
              exp=body:match("【EXP】(.-)【EXP】")
              local pref = activity.getSharedPreferences("plexuslogin", Context.MODE_PRIVATE)
              local save = pref.edit()
              save.putString("expired", exp)
              save.commit()
              save.putString("human", "1")
              save.commit()
              activity.newActivity("home")
              activity.finish()
             elseif body:match("Expired") then
              print("Key expired!")
             elseif body:match("Deactive") then
              print("Key has been deactivated!")
             elseif body:match("UUID not registered") then
              print("UUID not registered!")
             else
              print("Key not registered!")
            end
           else
            print("Can't connect to server!")
          end
        end
      end
    end);
  end
end

function btnGetKey.onClick()
  import "android.provider.Settings$Secure"
  uid = Secure.getString(activity.getContentResolver(), Secure.ANDROID_ID)
  import "android.content.Context"
  txtPass.setText(uid)
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(uid)
  MD提示("UUID already copied!")
end

function ic_ig.onClick()
  viewIntent = Intent("android.intent.action.VIEW",Uri.parse("https://zalo.me/0929688294"))
  activity.startActivity(viewIntent)
end

function ic_tg.onClick()
  viewIntent = Intent("android.intent.action.VIEW",Uri.parse("https://t.me/duchan94"))
  activity.startActivity(viewIntent)
end
