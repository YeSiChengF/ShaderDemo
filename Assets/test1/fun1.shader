Shader "Custom/fun1"
{
    Properties{
            _color("Main Color",Color)=(1,0,0,1)
            _Ambient("Ambient",Color)=(0.3,0.3,0.3,0.3)
            _Specular("Specular",Color)=(1,1,1,1)
            _Shininess("Shininess",Range(0,8))=4
            _Emission("Emission",Color)=(1,1,1,1)
            }
    SubShader
    {
        pass{
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
        }
    }
}
