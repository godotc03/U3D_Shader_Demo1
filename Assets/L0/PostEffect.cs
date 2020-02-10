using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class PostEffect : MonoBehaviour
{
    public Material mat;
    void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        //Graphics.Blit(src, dest);

        //1280*720
        //Color[] pixels = new Color[1280 * 720];
        //for (int x = 0; x < 1280; x++)
        //{
        //    for (int y = 0; y < 720; y++)
        //    {
        //        //pixels[x + 1280 * y].r = 1.2f * 0.7f; //Mathf.Sin(0.7f); Mathf.Pow(1.2f, 3);
        //        pixels[x + 1280 * y].r = 0.7f;
        //    }
        //}

        Graphics.Blit(src, dest, mat);
    }
}
