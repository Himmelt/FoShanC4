using S7HCOM_XLib;
using SimaticLib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ConsoleApp1
{
    internal class Program
    {
        [STAThread]
        static void Main(string[] args)
        {
            
            Console.WriteLine(Clipboard.GetData("Text"));
            return;
            int i = 0;
            Simatic simatic = (Simatic)Activator.CreateInstance(Marshal.GetTypeFromCLSID(new Guid("9A853ACF-BA8E-11D1-BAD8-0060086A411D")));
            foreach (IS7Project p in simatic.Projects)
            {
                S7ProjectType type = p.Type;
                if (p.Type == S7ProjectType.S7Project && !p.LogPath.Contains("Example"))
                {
                    Console.WriteLine(i++ + p.LogPath);
                    foreach (S7Program item in p.Programs)
                    {
                        if(item.Name == "S7-Program")
                        {
                           IS7Block s7  = (S7Block)item;
                        }
                    }
                    break;
                }
            }
        }
    }
}