	#!/Bin/Bash
    #Create /Var/Backup If It Doesn'T Exist
    Mkdir -P /Var/Backup
    
    #Create New /Var/Backup/Home.Tar
    Tar Cvf /Var/Backup/Home.Tar /Home
    
    #Moves The File /Var/Backup/Home.Tar To /Var/Backup/Home.Mmddyyy
    Mv /Var/Backup/Home.Tar /Var/Backup/Home.01012020.Tar
    
    #Creates An Archive Of /Home And Saves It To /Var/Backup/Home.Tar
    Tar Cvf /Var/Backup/System.Tar /Home
    
    #List All Files In /Var/Backup Including File Sizes And Save The Output To File To /Var/Backup/File_report.Txt
    Ls -Lh /Var/Backup > /Var/Backup/File_report.Txt
    
    #Print How Much Free Memory Your Machine Has Left
    Free -H > /Var/Backup/Disk_report.Txt

