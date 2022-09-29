Shader "Custom/fun2"
{
    Properties{
            _color("Main Color",Color)=(1,0,0,1)
            _Ambient("Ambient",Color)=(0.3,0.3,0.3,0.3)
            _Specular("Specular",Color)=(1,1,1,1)
            _Shininess("Shininess",Range(0,8))=4
            _Emission("Emission",Color)=(1,1,1,1)
            _MainTexture("MainTexture",2D)=""{}
            _SecondTexture("SecondTexture",2D)=""{}
            _ConstantColor("ConstantColor",Color)=(1,1,1,0.3)
            }
    SubShader
    {
        //在这只有渲染顺序的效果，具体看文档
        Tags{"Queue"="Transparent"}
        pass{
            //混合透明度，混合指和除自身外的像素混合
            // OneMinusSrcAlpha：1-当前透明度
            Blend SRCALPHA OneMinusSrcAlpha
            //color(1,0,0,1)
            //中括号表示参数值，小括号表示固定值
            //color[_color]
            Material{
                //漫反射
                DIFFUSE[_color]
                //光照颜色，需要打开linghting
                ambient[_Ambient]
                //高光颜色
                SPECULAR[_Specular]
                //浮点值 描述Specular的强度
                shininess[_Shininess]
                //自发光
                emission[_Emission]
            } 
            Lighting on
            SeparateSpecular on

            SetTexture[_MainTexture]{
                //只有贴图效果
                //Combine texture

                //primary 是 fixed function shader关键词，计算材质、光照后的颜色
                //颜色值相乘得到混合颜色(浮点数*浮点数会变得更小，也就是更暗)
                Combine texture * primary
                //double 两倍光照  quad 四倍光照
                //Combine texture * primary double
            }
            //SetTexture并不是无限的，显卡有最多混合纹理的个数
             SetTexture[_SecondTexture]{
                //primary只有顶点光照信息
                //previous表示先前的所有
                //Combine texture * previous

                //使用纹理透明通道
                ConstantColor[_ConstantColor]
                Combine texture * previous, texture * constant
            }
        }
    }
}
