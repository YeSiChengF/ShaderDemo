Shader "Custom/surFaceShader1"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        //SurfaceShader 没有Pass通道，是对Vexter Shader和fragment Shader的包装
        //生成对应代码

        //渲染类型
        //在渲染半透明时 需要修改渲染队列
        Tags { "RenderType"="Opaque" "queue"="transparent"}
        //层级细节
        LOD 200
        //从这到EndCG都是cg语法
        CGPROGRAM
        // 使用编写好的预制cg
        // Physically based Standard lighting model, and enable shadows on all light types

        //#pragma surface surf Standard fullforwardshadows alpha
        //去除阴影增加透明度
        #pragma surface surf Standard alpha

        // 硬件
        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0


        struct Input
        {
            //必须使用uv或者uv2开头
            float2 uv_MainTex;
        };
        //与Properties名称对应，类型不对应
        sampler2D _MainTex;
        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)
        //默认为in输入，inout输入输出对应
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
            // Metallic and smoothness come from slider variables
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Alpha = c.a;
        }
        ENDCG
    }
    //在没有得到阴影投射通道时，可以使用fallback指定有阴影投射的通道
    // FallBack "Diffuse"
}
