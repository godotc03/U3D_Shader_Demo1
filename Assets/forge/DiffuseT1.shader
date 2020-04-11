Shader "Custom/DiffuseT1"
{
    Properties
    {
        //_Name("Display Name", type) = defaultValue[{options}]
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}  //默认颜色有：”white”,”black”,”gray”,”bump”
                                                    //{} 内可填：ObjectLinear, EyeLinear, SphereMap, CubeReflect, CubeNormal
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    //可以有多个SubShader
    SubShader
    {
        //会编译成多个Pass
        Tags { "RenderType"="Opaque" }  //绘制非透明物体时 使用该SubShader 
                                        //"Transparent" 渲染透明物体
                                        //"IgnoreProjector"="True"  不受投影器影响
                                        //"ForceNoShadowCasting"="True" 不产生阴影
                                        //"Queue"="Transparent+100" 渲染队列优先级 Background Geometry AlphaTest Transparent Overlay
                                        //Background = 1000， Geometry = 2000, AlphaTest = 2450， Transparent = 3000，最后Overlay = 4000。
                                        
        LOD 200     //Level of Detail //Project settings => Quality Settings => Maxmum LOD Level
                    //设定的LOD小于SubShader所指定的LOD时，这个SubShader将不可用

        CGPROGRAM
        //#pragma surface surfaceFunction lightModel [optionalparams]
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows
        
        //#pragma surface surf        LightModel    vertex:vert

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0
        
        struct Input
        {
            float2 uv_MainTex;
        };

        sampler2D _MainTex; //采样器   //CG程序，要想访问在Properties中所定义的变量的话，必须使用和之前变量相同的名字进行声明。
        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

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
    FallBack "Diffuse"
}
