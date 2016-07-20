using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Timers;

namespace TA_Project
{
    class timerClass
    {
        public string tmrLabel { get; set; }
        public timerClass()
        {
            Timer myTimer = new Timer();
            myTimer.Elapsed += new ElapsedEventHandler(DisplayTimeEvent);
            myTimer.Interval = 1000;
            myTimer.Start();

            while (Console.Read() != 'q')
            {
                ;    // do nothing...
            }
        }

        private void DisplayTimeEvent(object source, ElapsedEventArgs e)
        {
            using (var frm = new mainForm())
            {
                this.tmrLabel = DateTime.Now.ToString();
            }
        }
    }
}
