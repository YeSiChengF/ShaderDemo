Shader "Custom/CgShader"
{
    SubShader
    {
        pass{
            CGPROGRAM
            //顶点和片段必须都有
            #pragma vertex vert
            #pragma fragment frag
            //变量 ： 语义(这个变量实际的意义)
            void vert(in float2 targetPos:POSITION，out float4 pos:POSITION,out float4 col:Color)
            {
                //顶点程序必须处理然后输出
                //将2阶向量凑成4阶向量
                pos=float4(targetPos,0,1);
                //语义不同类型相同也可以赋值
                //颜色值只能0~1所以负值只能当正值处理，负值时为0
                col=pos;
            }
            //COLOR0和COLOR等价
            void frag(out float4 col:COLOR)
            {
                //拿到顶点程序输出的数据继续处理
                //从cvv(裁剪正方体)取出像素进行着色
                //从-1到1的范围进行着色，左-1中0右1
                col=float4(1,0,1,1);
            }
            ENDCG
        }
    }
}
