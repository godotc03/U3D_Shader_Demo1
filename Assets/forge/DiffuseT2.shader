Shader "Custom/DiffuseT2"
{
    Properties
    {
        //_Name("Display Name", type) = defaultValue[{options}]
        _Color ("Color", Color) = (1,1,1,1) //每个分量 范围 0~1
        _MainTex ("Albedo (RGB)", 2D) = "bump" {}  //2的整数次幂 [”white”,”black”,”gray”,”bump”] 
    }
    SubShader   //可以有多个SubShader
    { //会编译成多个Pass
        Tags { "Queue"="Transparent" "RenderType"="Transparent" "IgnoreProjector"="True" }
        
        AlphaToMask On
        ZWrite Off
        
        LOD 100
        
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex; //采样器

        struct Input
        {
            float2 uv_MainTex;  //float2~4 fixed2~4 vec2~4
        };
        
        fixed4 _Color;

        /*
        struct SurfaceOutputStandard
        {
            fixed3 Albedo;      // base (diffuse or specular) color
            fixed3 Normal;      // tangent space normal, if written
            half3 Emission;
            half Metallic;      // 0=non-metal, 1=metal
            half Smoothness;    // 0=rough, 1=smooth
            half Occlusion;     // occlusion (default 1)
            fixed Alpha;        // alpha for transparencies
        };
        
        */

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
            //o.Albedo = fixed3(1,1,0);
            //o.Albedo = 1; //赋值 规则
            //o.Albedo = _Color.rgb;
            
            //o.Metallic = 1;
            //o.Smoothness = 1;
            //o.Emission = fixed3(0,1,0);
            o.Alpha = 0.2;
        }
        ENDCG
    }
   
    FallBack "Diffuse"
}
