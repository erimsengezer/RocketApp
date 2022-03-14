#  ViperTemplate
- Close Xcode
- Export the zip file
- Go to /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates
- Put it there as a file and if it asks for password confirmation, give it a confirmation.
- You write just the module name. For example Profile
- It will automatically be creating a file list. 
- File Example:
Profile
    Builder
        ProfileBuilder.swift
    Presenter
        ProfilePresenter.swift
    Interactor
        ProfileInteractor.swift
    Repository
        ProfileRepository.swift
    Service
        ProfileService.swift
    View
        ProfileViewController.swift
        ProfileViewController.xib
    Coordinator
        ProfileCoordinator.swift
