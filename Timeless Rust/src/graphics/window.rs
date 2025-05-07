use winit::{
    application::ApplicationHandler,
    event::WindowEvent,
    event_loop::{ActiveEventLoop, ControlFlow, EventLoop},
    window::{Window, WindowAttributes, WindowId},
};

pub fn run_window() {
    let event_loop = EventLoop::new().expect("Could not create Event Loop");
    event_loop.set_control_flow(ControlFlow::Poll);

    let mut window = GameWindow::default();
    event_loop
        .run_app(&mut window)
        .expect("Could not run application");
}

#[derive(Default)]
struct GameWindow {
    window: Option<Window>,
}

impl ApplicationHandler for GameWindow {
    fn resumed(&mut self, event_loop: &ActiveEventLoop) {
        let attributes = WindowAttributes::new()
            .with_maximized(true)
            .with_title("Timeless");

        self.window = Some(
            event_loop
                .create_window(attributes)
                .expect("Could not create window"),
        );
    }

    fn window_event(&mut self, event_loop: &ActiveEventLoop, id: WindowId, event: WindowEvent) {
        match event {
            WindowEvent::CloseRequested => {
                event_loop.exit();
            }
            WindowEvent::RedrawRequested => {
                self.window.as_ref().unwrap().request_redraw();
            }
            _ => (),
        }
    }
}
